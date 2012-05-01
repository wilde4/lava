module Lava
  class ElementsController < Lava::ApplicationController

    def index
      @elements = Lava::Element.all
    end

    def show
      @element = Lava::Element.find_using_slug(params[:id])
    end

  end
end