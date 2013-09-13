module Lava
  class Element < ActiveRecord::Base
    include Models::Element
    
    belongs_to :user
    belongs_to :page
    
  end
end