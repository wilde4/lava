module Lava
  class ElementsController < ::ApplicationController
    layout false
    protect_from_forgery except: :create

    def show
      @element = Lava::Element.find(params[:id])
    end


    def save_content
      @element = Lava::Element.where(:md5_reference => params[:md5_reference]).first
      
      @new_element = Lava::Element.create({
        :reference => @element.reference,
        :md5_reference => @element.md5_reference,
        :value => params[:value],
        :page_id => params[:page_id],
        :path => params[:path],
        :user => current_user,
        :element_type => "text"
      })
      
      # params[:content].each do |k,v|
      #   element_id = k.gsub("primary_", "")
      #   value = v["value"]
      #   @element = Lava::Element.find(element_id)
      #   @element.update_attribute(:value, value)
      # end

      render text: ""
    end

    def create
      @element = Lava::Element.find_or_create_element(params[:element].permit!)
      @element.update_attributes({:value => params[:value]}) if params[:value]
      @element.update_attributes(params[:element].permit!) if params[:element]
      # args = {:width => params[:element][:width], :height => params[:element][:height]}
      
      respond_to do |format|
        format.js {
          render :partial => "lava/elements/#{@element.element_type}",  :locals => { :element => @element, :args => args }
        }
        format.html {
          redirect_to :back
        }
      end
    end

    def update
      @element = Lava::Element.find(params[:id])
      params[:element][:value] = url_unescape(params[:element][:value]) if params[:element][:value].present?
      params[:element][:url] = url_unescape(params[:element][:url]) if params[:element][:url].present?
      @element.update_attributes(params[:element].permit!)

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