require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @user2 = users(:two)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      @new_user = { id: 999, email: "email@gmail.com", messaging_preferences: {"articles"=>true, "marketing"=>false, "digest"=>true}, name: "New User Name" }
      post users_url, params: { user: { id: @new_user[:id], email: @new_user[:email], messaging_preferences: @new_user[:messaging_preferences], name: @new_user[:name] } }
    end
    # assert_redirected_to user_url(@new_user)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    @token = Token.generate(@user)
    patch user_url(@user), params: { user: { email: "new_email_address@gmail.com", messaging_preferences: @user.messaging_preferences, name: @user.name } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end

  test "name should be correctly set" do
    assert @user.name == "Jimmy John"
  end

  test "email should be correctly set" do
    assert @user.email == "Jimmy_J@Gmail.com"
  end

  test "messaging preferences should be correctly set" do
    assert @user.messaging_preferences == {"articles"=>true, "marketing"=>false, "digest"=>true}
  end

end
