module Lava
  class ApplicationController < ::ApplicationController

    # hook this into devise if you wish
    def can_edit?
      true
      #user_signed_in? && current_user.admin? # standard affair
    end
    helper_method :can_edit?

  end
end