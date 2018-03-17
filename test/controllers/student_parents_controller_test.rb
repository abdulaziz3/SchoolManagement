require 'test_helper'

class StudentParentsControllerTest < ActionController::TestCase
  setup do
    @student_parent = student_parents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_parents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_parent" do
    assert_difference('StudentParent.count') do
      post :create, student_parent: { student_id: @student_parent.student_id, user_id: @student_parent.user_id }
    end

    assert_redirected_to student_parent_path(assigns(:student_parent))
  end

  test "should show student_parent" do
    get :show, id: @student_parent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_parent
    assert_response :success
  end

  test "should update student_parent" do
    patch :update, id: @student_parent, student_parent: { student_id: @student_parent.student_id, user_id: @student_parent.user_id }
    assert_redirected_to student_parent_path(assigns(:student_parent))
  end

  test "should destroy student_parent" do
    assert_difference('StudentParent.count', -1) do
      delete :destroy, id: @student_parent
    end

    assert_redirected_to student_parents_path
  end
end
