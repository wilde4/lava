module Lava
  module Models
    module Image
      extend ActiveSupport::Concern

      included do
        file_accessor :upload
        
        default_scope { order(created_at: :desc) }
      end
    end
  end
end