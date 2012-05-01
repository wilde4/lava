module Lava
  class ElementsController < Lava::ApplicationController

    layout false

    def show
      @element = Element.find(params[:id])
    end

    def new
      @element = Element.new
    end

    def create
      @element = Element.find_or_create_element(params[:element])
      @element.update_attributes({:value => params[:value]}) if params[:value]
      @element.update_attributes(params[:element]) if params[:element]  
      args = {:width => params[:element][:width], :height => params[:element][:height]}
      render :partial => "lava/elements/#{@element.element_type}",  :locals => { :element => @element, :args => args }
    end

    def edit
      @element = Element.find_by_instance_id(params[:instance_id])
    end

    def update
      @element = Element.find_or_create_element(params[:element])
      @element.update_attributes(params[:element])
      render :partial => "lava/elements/#{@element.element_type}",  :locals => { :element => @element }
    end

    def destroy
      @element = Element.find(params[:id])
      @element.destroy
      redirect_to :back
    end

  end
end