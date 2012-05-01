module Lava
  module Models
    module Element
      extend ActiveSupport::Concern

      included do
        validates_presence_of :reference

        file_accessor :upload
        
        default_scope :order => "created_at DESC"

        attr_accessor :width, :height

        def self.find_or_create_element(element_attributes)
          element = self.find(:first, :conditions => {:reference => element_attributes[:reference], :element_type => element_attributes[:element_type]})
          if element.nil?
            element = self.create(element_attributes)
          end
          element
        end
      end
    end
  end
end