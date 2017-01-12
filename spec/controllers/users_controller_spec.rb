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

  # describe "SHOW user" do
  #   @user
  # end

  describe "POST user" do
    it "responds to html by default" do
      post :create, { :user => {name: "Test User", email: "controller_test1@email.com", messaging_preferences: {marketing: true, articles: true, digest: true } } }
      expect(response.content_type).to eq "text/html"
      expect(response.status).to eq(200)
    end
  end


end
