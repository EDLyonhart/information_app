require 'test_helper'

class TokensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @token = tokens(:one)
  end

  test "should get new" do
    get new_token_path
    assert_response :success
  end

  test "should get create" do
    get new_token_path
    assert_response :success
  end

end
