require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { dob: @user.dob, email: @user.email, f_name: @user.f_name, gender: @user.gender, l_name: @user.l_name, national_id: @user.national_id, nationality: @user.nationality, password_digst: @user.password_digst }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { dob: @user.dob, email: @user.email, f_name: @user.f_name, gender: @user.gender, l_name: @user.l_name, national_id: @user.national_id, nationality: @user.nationality, password_digst: @user.password_digst }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
