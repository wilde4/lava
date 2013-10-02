module Lava
  class ElementsController < Lava::ApplicationController
    layout false

    def show
      @element = Lava::Element.find(params[:id])
    end

    def new
      @element = Lava::Element.new
    end

    def save_content
      # {"content"=>{"primary_4"=>{"type"=>"full", "data"=>{}, "value"=>"<p>hello world alksdjf lasdfa<br>a<br>sdf<br>asdf<br><br></p>", "snippets"=>{}}}, "element"=>{}}
      params[:content].each do |k,v|
        element_id = k.gsub("primary_", "")
        value = v["value"]
        @element = Lava::Element.find(element_id)
        if @element.update_attributes({:value => value})
          puts "++++++++++ UPDATE: OK ++++++++++";
        else
          puts "++++++++++ UPDATE: FAILED ++++++++++";          
        end
      end
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

    def edit
      @element = Lava::Element.find_by instance_id: params[:instance_id]
    end

    def update
      @element = Lava::Element.find params[:id]
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