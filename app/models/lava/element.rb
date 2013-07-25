module Lava
  class Element < ActiveRecord::Base
    include Models::Element
    
    belongs_to :user
    
  end
end