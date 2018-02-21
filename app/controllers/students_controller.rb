class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :student_authorise, only: [:update, :edit, :show]
  before_action :require_admin, only: [:destroy, :index]
  before_action :authorised, only: [:show]

  def index
    @students = Student.paginate(page: params[:page], per_page: 25)
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    @subjects = Subject.where(grade_id: @student.grade_id)
    if @student.save
      #StudentMailer.welcone(@student).deliver_new
      @subjects.each do|subject|
        student_subject = StudentSubject.new
        student_subject.student_id = @student.id
        student_subject.subject_id = subject.id
        student_subject.save
      end

      session[:student_id] = @student.id
      flash[:success] = "Welcome to School Management System #{@student.f_name}"

      redirect_to student_path(@student)
    else
      render 'new'
    end
  end

  def update
    if @student.update(student_params)
      flash[:success] = "User was successfully updated"
      redirect_to student_path(@student)
    else
      render 'new'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    flash[:danger] = "User was successfully deleted"
    redirect_to student_path
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:f_name, :l_name, :nationality, :address, :city, :post_code, :gender, :phone, :email, :dob,
                                      :username, :password, :password_confirmation, :grade_id)
    end
end
