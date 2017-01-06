require 'test_helper'

class TokensControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tokens_new_url
    assert_response :success
  end

  test "should get create" do
    get tokens_create_url
    assert_response :success
  end

  test "should get update" do
    get tokens_update_url
    assert_response :success
  end

  test "should get destroy" do
    get tokens_destroy_url
    assert_response :success
  end

end
