require 'test_helper'

class AttendanceDescriptionsControllerTest < ActionController::TestCase
  setup do
    @attendance_description = attendance_descriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attendance_descriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attendance_description" do
    assert_difference('AttendanceDescription.count') do
      post :create, attendance_description: { att_status: @attendance_description.att_status }
    end

    assert_redirected_to attendance_description_path(assigns(:attendance_description))
  end

  test "should show attendance_description" do
    get :show, id: @attendance_description
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attendance_description
    assert_response :success
  end

  test "should update attendance_description" do
    patch :update, id: @attendance_description, attendance_description: { att_status: @attendance_description.att_status }
    assert_redirected_to attendance_description_path(assigns(:attendance_description))
  end

  test "should destroy attendance_description" do
    assert_difference('AttendanceDescription.count', -1) do
      delete :destroy, id: @attendance_description
    end

    assert_redirected_to attendance_descriptions_path
  end
end
