module Lava
  module LavaHelper

    def add_markup(value)
      # Custom add_markup method should be included
      # in your project.  This will likely also include
      # widget replacement codes and a markup converter.

      value.split("\n").map{|p| "<p>#{p}</p>" if p.present? }.join("") rescue value
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