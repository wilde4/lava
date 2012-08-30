module Lava
  class ElementsController < Lava::ApplicationController
    layout false

    def show
      @element = Lava::Element.find(params[:id])
    end

    def new
      @element = Lava::Element.new
    end

    def create
      @element = Lava::Element.find_or_create_element(params[:element])
      @element.update_attributes({:value => params[:value]}) if params[:value]
      @element.update_attributes(params[:element]) if params[:element]
      args = {:width => params[:element][:width], :height => params[:element][:height]}
      render :partial => "lava/elements/#{@element.element_type}",  :locals => { :element => @element, :args => args }
    end

    def edit
      @element = Lava::Element.find_by_instance_id(params[:instance_id])
    end

    def update
      @element = Lava::Element.find(params[:id])
      params[:element][:value] = url_unescape(params[:element][:value]) if params[:element][:value].present?
      params[:element][:url] = url_unescape(params[:element][:url]) if params[:element][:url].present?
      @element.update_attributes(params[:element])

      respond_to do |format|
        format.js
        format.html {
          render :partial => "lava/elements/#{@element.element_type}",  :locals => { :element => @element }
        }
      end
    end

    def destroy
      @element = Lava::Element.find(params[:id])
      @element.destroy
      redirect_to :back
    end

    private

    def url_unescape(string)
      string.tr('+', ' ').gsub(/((?:%[0-9a-fA-F]{2})+)/n) do
        [$1.delete('%')].pack('H*')
      end
    end

  end
end