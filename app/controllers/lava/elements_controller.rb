module Lava
  class ElementsController < Lava::ApplicationController
    layout false

    def show
      @element = Lava::Element.find(params[:id])
    end


    def save_content
      @element = Lava::Element.where(:md5_reference => params[:md5_reference]).first
      
      @new_element = Lava::Element.create({
        :reference => @element.reference,
        :md5_reference => @element.md5_reference,
        :value => params[:value],
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

    private

    def url_unescape(string)
      string.tr('+', ' ').gsub(/((?:%[0-9a-fA-F]{2})+)/n) do
        [$1.delete('%')].pack('H*')
      end
    end

  end
end