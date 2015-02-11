module Lava
  module Models
    module Element
      extend ActiveSupport::Concern

      included do
        
        validates_presence_of :reference

        dragonfly_accessor :upload
        
        default_scope { :order => "created_at DESC" }

        def timestamp=(value)
          true
        end
        
        def self.find_or_create_element(element_attributes)
          elements = self.where({
            :reference    => element_attributes[:reference],
            :element_type => element_attributes[:element_type]
          })

          if(element_attributes[:timestamp].present?)
            timestamp = Time.at(element_attributes[:timestamp].to_i)
            elements = elements.where("created_at <= ?", timestamp)
          end
            
          element = elements.first
          if element.nil?
            element = self.create(element_attributes)
          end
            element
        end
      end
    end
  end
end