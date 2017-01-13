require 'rails_helper'

RSpec.describe UsersController, type: :controller do


  describe "GET #index" do
    subject { get :index }

    it "renders the index template" do
      expect(subject).to render_template(:index)
      expect(response.status).to eq(200)
    end

    it "does not render a different template" do
      expect(subject).to_not render_template("users/show")
    end
  end

  describe "GET #new" do
    subject { get :new }

    it "renders the new_user template" do
      expect(subject).to render_template(:new)
      expect(response.status).to eq(200)
    end

    it "does not render a different template" do
      expect(subject).to_not render_template("users/show")
    end
  end

  describe "GET #show" do

    it "renders the show_user template" do
      @user = FactoryGirl.create(:user)
      
      get :show, params: { id: @user.id }
      expect(subject).to render_template("users/show")
      expect(response.status).to eq(200)
    end

    it "does not render a different template" do
      expect(subject).to_not render_template("users/index")
    end
  end

  describe "GET #edit" do

    it "renders the edit_user template" do
      @user = FactoryGirl.create(:user)
      
      get :edit, params: { id: @user.id }
      expect(subject).to render_template("users/edit")
      expect(response.status).to eq(200)
    end

    it "does not render a different template" do
      expect(subject).to_not render_template("users/show")
    end
  end

  # describe "POST action" do

  #   it "should create a user" do
  #     create(:user)
  #     expect(response.status).to eq(200)
  #   end
  # end

  # after(:example) do
  #   @user.delete
  # end
end