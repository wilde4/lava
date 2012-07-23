require "spec_helper"

describe Lava::ElementsController do
  let(:params) { { :id => "21" } }
  
  describe "GET show" do
    let(:element) { mock_model(Lava::Element) }

    before do
      Lava::Element.stub(:find) { element }
    end
    
    subject { get :show, params }
    
    it "should find the element by ID" do
      Lava::Element.should_receive(:find).with(params[:id]) { element }
      subject
    end
    it "should assign the element" do
      subject
      assigns(:element).should == element
    end
    it { should render_template :show }
  end
  
  describe "GET new" do
    let(:element) { mock_model(Lava::Element) }

    before do
      Lava::Element.stub(:find) { element }
    end

    subject { get :new }

    it "should initialize a new element" do
      Lava::Element.should_receive(:new) { element }
      subject
    end
    it "should assign the element" do
      subject
      assigns(:element).should == element
    end
    it { should render_template :new }
  end

  describe "POST create" do
    subject { post :create, params }
  end

  describe "GET edit" do
    subject { get :edit, params }
  end

  describe "PUT update" do
    subject { put :update, params }
  end

  describe "DELETE destroy" do
    subject { delete :destroy, params }
  end

end