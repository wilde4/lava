require "spec_helper"

describe Lava::ElementsController do
  let(:params) { { :id => "21" } }
  
  describe "GET index" do
    subject { get :index }
  end
  
  describe "GET show" do
    subject { get :show, params }
  end

end