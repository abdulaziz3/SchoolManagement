class HomeworksController < ApplicationController
  before_action :set_homework, only: [:show, :edit, :update, :destroy]

  # GET /homeworks
  # GET /homeworks.json
  def index
    @homeworks = Homework.all
  end

  # GET /homeworks/1
  # GET /homeworks/1.json
  def show
  end

  # GET /homeworks/new
  def new
    @homework = Homework.new
    @subject_user_id = session[:user_id]
    #p @subject_user_id
    #@stu_sub = Subject.where(@subject.user_id == session[:user_id])
  end

  # GET /homeworks/1/edit
  def edit
  end

  # POST /homeworks
  # POST /homeworks.json
  def create
    @homework = Homework.new(homework_params)
    @homework.user_id = session[:user_id]
    @students = StudentSubject.where('subject_id = ?',@homework.subject_id)
    # p homework_params
    respond_to do |format|
      if @homework.save

         @students.each do |student|
           student_homework = StudentHomework.new
           student_homework.homework_id = @homework.id
           student_homework.student_id = student.student_id
           student_homework.save
         end

        format.html { redirect_to @homework, notice: 'Homework was successfully created.' }
        format.json { render :show, status: :created, location: @homework }
      else
        format.html { render :new }
        format.json { render json: @homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homeworks/1
  # PATCH/PUT /homeworks/1.json
  def update
    respond_to do |format|
      if @homework.update(homework_params)
        format.html { redirect_to @homework, notice: 'Homework was successfully updated.' }
        format.json { render :show, status: :ok, location: @homework }
      else
        format.html { render :edit }
        format.json { render json: @homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homeworks/1
  # DELETE /homeworks/1.json
  def destroy
    @homework.destroy
    respond_to do |format|
      format.html { redirect_to homeworks_url, notice: 'Homework was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homework
      @homework = Homework.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def homework_params
      params.require(:homework).permit(:homework_name, :description, :marking, :user_id, :subject_id)
    end
end
