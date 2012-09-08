module Lava
  module LavaHelper

    def add_markup(value)
      output = value.to_str.gsub(/\{\{(.*)\}\}/) do |keyword|
        partial = keyword.gsub(/(\{|\})/, "")
        if partial[0..5] == 'image_'
          # Try to render the image
          pieces = partial.split("_")
          begin
            image = Image.find(pieces[1])

            image_partial = pieces[2]
            begin
              render "layouts/widgets/images/#{image_partial}", :image => image
            rescue
              "** Error: Image Style <b>#{image_partial}</b> not found **"
            end
          rescue
            "** Error: Image ID <b>#{pieces[1]}</b> not found **"
          end
        else
          # Try to render a manual partial
          begin
            # partial may contain an optional variable, e.g. section_menu(4)
            # we want to pass this variable to the widget so it can take 
            # an option, e.g. social_churn(abs342-asdlkfjl3...)
            if partial.scan(/(\w*)\(([\w\-]*)\)/).flatten.count > 1
              # Hooray! This partial contains an optioanl param...
              pieces = partial.scan(/(\w*)\(([\w\-]*)\)/).flatten
              partial = pieces[0]
              render :partial => "layouts/widgets/#{partial}", :locals => {:optional_param => pieces[1] }                            
            else
              render "layouts/widgets/#{partial}"              
            end
            

          rescue
            "** Error: <b>#{partial}</b> **"
          end
        end
      end
      output
    end

    # def add_markup(value)
    #   output = value.to_str.gsub(/\{\{(.*)\}\}/) do |keyword|
    #     partial = keyword.gsub(/(\{|\})/, "")
    #     if partial =~ /^image_/
    #       prefix, image_id, image_partial = partial.split("_")
    #       render_image(image_partial, image_id)
    #     else
    #       render_widget(partial)
    #     end
    #   end
    #   output
    # end

    # def render_widget(partial)
    #   render "layouts/widgets/#{partial}"
    # rescue ActionView::MissingTemplate => e
    #   "** Error: Couldn't find widget <b>#{partial}</b> **"
    # end

    # def render_image(partial, image_id)
    #   image = Image.find(image_id)
    #   render "layouts/widgets/images/#{image_partial}", :image => image
    # rescue ActiveRecord::RecordNotFound => e
    #   e.message
    # rescue ActionView::MissingTemplate => e
    #   "** Error: Image Style <b>#{image_partial}</b> not found **"
    # end

    def lava(args = {})
      supported_types = ["text", "image", "video"]
      raise ArgumentError, "No reference given." unless args.has_key?(:reference)

      element_type = args.has_key?(:element_type) ? args[:element_type] : "text"
      raise ArgumentError, "Element type unsupported." unless supported_types.include?(element_type)

      if element_type == "image" || element_type == "video"
        raise ArgumentError, "No width given."              unless args.has_key?(:width)
        raise ArgumentError, "Width should be an integer."  unless args[:width].is_a?(Integer)
        raise ArgumentError, "No height given."             unless args.has_key?(:height)
        raise ArgumentError, "Height should be an integer." unless args[:height].is_a?(Integer)
      elsif element_type == "text"
        args[:editor_rows]  = args.has_key?(:rows) ? args[:rows].to_i : 1
        args[:editor_type]  = args[:editor_rows] > 1 ? "textarea" : "text"
        args[:truncate]     = args.has_key?(:truncate) ? args[:truncate] : nil
      end

      md5_ref = Digest::MD5.hexdigest(args[:reference])
      element = Element.find_or_create_element(:element_type => element_type, :reference => args[:reference], :md5_reference => md5_ref)
      render "lava/elements/element_#{element_type}", {:args => args, :element => element} if element.present?
    end

  end
end