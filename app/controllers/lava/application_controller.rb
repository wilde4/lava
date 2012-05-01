module Lava
  class ApplicationController < ::ApplicationController

    private

    def can_edit?
      true
    end

  end
end