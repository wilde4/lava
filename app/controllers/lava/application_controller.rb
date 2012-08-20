module Lava
  class ApplicationController < ::ApplicationController
    def can_edit?
      true
    end
  end
end