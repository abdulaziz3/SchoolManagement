require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: { address: @student.address, city: @student.city, dob: @student.dob, email: @student.email, f_name: @student.f_name, gender: @student.gender, l_name: @student.l_name, nationality: @student.nationality, password_digest: @student.password_digest, phone: @student.phone, post_code: @student.post_code, user_id: @student.user_id, username: @student.username }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student
    assert_response :success
  end

  test "should update student" do
    patch :update, id: @student, student: { address: @student.address, city: @student.city, dob: @student.dob, email: @student.email, f_name: @student.f_name, gender: @student.gender, l_name: @student.l_name, nationality: @student.nationality, password_digest: @student.password_digest, phone: @student.phone, post_code: @student.post_code, user_id: @student.user_id, username: @student.username }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end
