require 'rails_helper'
require 'test_helper'

RSpec.describe TokensController do
  setup do
    # @token = tokens(:one)
    # @user = users(:one)
    @user = User.new(id: 998, name: "Test User", email: "test@email.com", messaging_preferences: {marketing: true, articles: true, digest: true })
    @token = Token.new(nonce: "asdf1234", user_id: 1 )
  end

  # test "should get new" do
  #   get new_token_path
  #   assert_response :success
  # end

  describe "Token" do

    it "should increase the number of tokens" do
      token_count = Token.count
      expect{Token.generate(@user)}.to change{Token.count}.from(token_count).to(token_count+1)
    end

    # it "should set user_id to user's id" do
    #   @user.save

    #   @token = Token.generate(@user)
    #   expect @token.user_id == @user.id

    #   @user.delete
    #   @token.delete
    # end
  end

end

# RSpec.describe TokensController do
#   describe "truth" do
#     it "is true" do
#       expect true
#     end
#   end
# end
