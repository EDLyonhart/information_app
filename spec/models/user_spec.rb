require 'rails_helper'

RSpec.describe User, type: :model do
  before(:example) do
    @user = User.create!(name: "Test User", email: "model_test1@email.com", messaging_preferences: {marketing: true, articles: true, digest: true })
    @token = Token.generate(@user)
    @user2 = User.create!(name: "Test User", email: "model_test2@email.com", messaging_preferences: {marketing: true, articles: true, digest: true })
  end

  context "confirm_token method" do
    it "should return true if user has an assoiated token" do
      expect @user.confirm_token == true
    end

    it "should set all messaging preferences to false" do
      expect @user.marketing == false
      expect @user.articles == false
      expect @user.digest == false
    end

    it "should return false if user has no token" do
      expect @user2.confirm_token == false
    end
  end

  context "unsubscribe_from_all method" do
    it "should set all messaging prefereces to false" do
      expect @user2.marketing == false
      expect @user2.articles == false
      expect @user2.digest == false
    end
  end

  after(:example) do
    @user.delete
    @user2.delete
    @token.delete
  end
end
