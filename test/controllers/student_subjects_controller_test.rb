require 'test_helper'

class StudentSubjectsControllerTest < ActionController::TestCase
  setup do
    @student_subject = student_subjects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_subjects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_subject" do
    assert_difference('StudentSubject.count') do
      post :create, student_subject: { student_id: @student_subject.student_id, subject_id: @student_subject.subject_id }
    end

    assert_redirected_to student_subject_path(assigns(:student_subject))
  end

  test "should show student_subject" do
    get :show, id: @student_subject
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_subject
    assert_response :success
  end

  test "should update student_subject" do
    patch :update, id: @student_subject, student_subject: { student_id: @student_subject.student_id, subject_id: @student_subject.subject_id }
    assert_redirected_to student_subject_path(assigns(:student_subject))
  end

  test "should destroy student_subject" do
    assert_difference('StudentSubject.count', -1) do
      delete :destroy, id: @student_subject
    end

    assert_redirected_to student_subjects_path
  end
end
