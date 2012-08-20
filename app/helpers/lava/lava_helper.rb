module Lava
  module LavaHelper

    # def can_edit?
    #   true
    # end

    def lava(args = {})
      supported_types = ["text", "image", "video"]
      raise ArgumentError, "No reference given." unless args.has_key?(:reference)

      element_type = args.has_key?(:element_type) ? args[:element_type] : "text"
      raise ArgumentError, "Element type unsupported." unless supported_types.include?(element_type)

      if element_type == "image" || element_type == "video"
        raise ArgumentError, "No width given." unless args.has_key?(:width)
        raise ArgumentError, "Width should be an integer."  unless args[:width].is_a?(Integer)
        raise ArgumentError, "No height given."             unless args.has_key?(:height)
        raise ArgumentError, "Height should be an integer." unless args[:height].is_a?(Integer)
      elsif element_type == "text"
        args[:editor_rows] = args.has_key?(:rows) ? args[:rows].to_i : 1
        args[:editor_type] = args[:editor_rows] > 1 ? "textarea" : "text"
        args[:truncate] = args.has_key?(:truncate) ? args[:truncate] : nil
      end

      element = Element.find_or_create_element(:element_type => element_type, :reference => args[:reference])
      render "lava/elements/element_#{element_type}", {:args => args, :element => element} if element.present?
    end

  end
end