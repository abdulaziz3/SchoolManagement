require 'test_helper'

class StudentHomeworksControllerTest < ActionController::TestCase
  setup do
    @student_homework = student_homeworks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_homeworks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_homework" do
    assert_difference('StudentHomework.count') do
      post :create, student_homework: { homework_id: @student_homework.homework_id, student_id: @student_homework.student_id }
    end

    assert_redirected_to student_homework_path(assigns(:student_homework))
  end

  test "should show student_homework" do
    get :show, id: @student_homework
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_homework
    assert_response :success
  end

  test "should update student_homework" do
    patch :update, id: @student_homework, student_homework: { homework_id: @student_homework.homework_id, student_id: @student_homework.student_id }
    assert_redirected_to student_homework_path(assigns(:student_homework))
  end

  test "should destroy student_homework" do
    assert_difference('StudentHomework.count', -1) do
      delete :destroy, id: @student_homework
    end

    assert_redirected_to student_homeworks_path
  end
end
