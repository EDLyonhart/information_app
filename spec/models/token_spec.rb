require 'rails_helper'

RSpec.describe Token, type: :model do
  before(:example) do
    @user = User.create!(name: "Test User", email: "test2@email.com", messaging_preferences: {marketing: true, articles: true, digest: true })
    @init_token_count = Token.count
    @token = Token.generate(@user)
  end

  context "generate static method should" do
    it "increase the number of tokens" do
      expect Token.count == @init_token_count+1
    end

    it "associate correct user_id" do
      expect @user.id == @token.user_id
    end
  end

  after(:example) do
    @user.delete
    @token.delete
  end
end
