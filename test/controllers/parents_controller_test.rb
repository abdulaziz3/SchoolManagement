require 'test_helper'

class ParentsControllerTest < ActionController::TestCase
  setup do
    @parent = parents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parent" do
    assert_difference('Parent.count') do
      post :create, parent: { dob: @parent.dob, f_name: @parent.f_name, job: @parent.job, l_name: @parent.l_name, phone: @parent.phone, student_id: @parent.student_id, work_phone: @parent.work_phone }
    end

    assert_redirected_to parent_path(assigns(:parent))
  end

  test "should show parent" do
    get :show, id: @parent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parent
    assert_response :success
  end

  test "should update parent" do
    patch :update, id: @parent, parent: { dob: @parent.dob, f_name: @parent.f_name, job: @parent.job, l_name: @parent.l_name, phone: @parent.phone, student_id: @parent.student_id, work_phone: @parent.work_phone }
    assert_redirected_to parent_path(assigns(:parent))
  end

  test "should destroy parent" do
    assert_difference('Parent.count', -1) do
      delete :destroy, id: @parent
    end

    assert_redirected_to parents_path
  end
end
