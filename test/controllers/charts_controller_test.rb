require 'test_helper'

class ChartsControllerTest < ActionController::TestCase
  test "should get chart_attendance" do
    get :chart_attendance
    assert_response :success
  end

  test "should get chart_student_grades" do
    get :chart_student_grades
    assert_response :success
  end

  test "should get chart_user_roles" do
    get :chart_user_roles
    assert_response :success
  end

  test "should get chart_student_marke_grades" do
    get :chart_student_marke_grades
    assert_response :success
  end

end
