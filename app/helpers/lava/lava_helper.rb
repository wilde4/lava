module Lava
  module LavaHelper

    # def add_markup(value)
    #   # Custom add_markup method should be included
    #   # in your project.  This will likely also include
    #   # widget replacement codes and a markup converter.
    # 
    #   value.split("\n").map{|p| "<p>#{p}</p>" if p.present? }.join("") rescue value
    # end
    
    def add_markup(value)
      # output = RDiscount.new(value).to_html.html_safe
      output = value.to_str.gsub(/\{\{(.*)\}\}/) do |keyword|
        partial = keyword.gsub(/(\{|\})/, "")
        if partial[0..5] == 'image_'
          # Try and render the image

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
          # Try and render a manual partial
          begin
            render "layouts/widgets/#{partial}"
          rescue
            "** Error: Couldn't find widget <b>#{partial}</b> **"
          end
        end
      end
      output
    end

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