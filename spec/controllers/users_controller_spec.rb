require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before(:example) do
    @users = User.all
    @user = User.last
  end

  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "returns all users" do
      expect @users.count == User.all.count
    end
  end

  describe "SHOW user" do
    
  end

  describe "POST" do
    it "should create a user" do
      create(:user)
      expect(response.status).to eq(200)
    end
  end


end
