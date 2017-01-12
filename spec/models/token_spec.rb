require 'rails_helper'

RSpec.describe Token, type: :model do
  before(:example) do
    @user = User.create!(name: "Test User", email: "test2@email.com", messaging_preferences: {marketing: true, articles: true, digest: true })
    @init_token_count = Token.count
    @token = Token.generate(@user)
  end

  context "generate static method" do
    it "should increase the number of tokens" do
      expect Token.count == @init_token_count+1
    end

    it "should associate correct user_id" do
      expect @user.id == @token.user_id
    end

    it "should only create a token for users who dont have one associated" do
      # Inital token count has already been incremented once above
      expect Token.count != @init_token_count+2
      expect Token.generate(@user) == "User already has an associated token"
    end
  end

context "consume static method" do
  it "should delete the token and return associated user" do
    expect Token.consume(@token.nonce) == @user
    expect Token.count == @init_token_count
  end

  it "should return nil for a token which cant be found" do
    expect Token.consume(@token.nonce) == nil
  end
end

  after(:example) do
    @user.delete
  end
end
