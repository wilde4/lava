module Lava
  module Models
    module Element
      extend ActiveSupport::Concern

      included do
        attr_accessor :width, :height
        
        validates_presence_of :reference

        file_accessor :upload
        
        default_scope :order => "created_at DESC"

        def self.find_or_create_element(element_attributes)
          element = self.where({
            :reference    => element_attributes[:reference],
            :element_type => element_attributes[:element_type]}).first
          if element.nil?
            element = self.create(element_attributes)
          end
          element
        end
      end
    end
  end
end