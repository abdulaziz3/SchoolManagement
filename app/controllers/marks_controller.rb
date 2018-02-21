class MarksController < ApplicationController
  before_action :set_mark, only: [:show, :edit, :update, :destroy]

  # GET /marks
  # GET /marks.json
  def index
    @marks = Mark.paginate(page: params[:page], per_page: 25)
  end

  # GET /marks/1
  # GET /marks/1.json
  def show
  end

  # GET /marks/new
  def new
    @homeworkValue = params["homeworkValue"]
    #p "Test value: "  + @homeworkValue.to_s
    # @homeworksTaken = Mark.checkHomework params[:homeworkValue]
    @displayStudent = false
    if @homeworkValue
      @displayStudent = true
    end
    @mark = Mark.new
    @marks_user_id = session[:user_id]
  end

  # GET /marks/1/edit
  def edit
  end

  def saveMarks
    #p "Save marks"
    @students = Student.all
    @homeworkValue = params['post']['marks_homework_id']
    @students.joins(:student_homeworks).where("homework_id = ?", @homeworkValue).each do |student|
      studentid = student.id
      marks = Mark.new
      marks.student_id = student.id
      marks.subject_id = params["post"]["marks_subject_id"]
      marks.homework_id = params["post"]["marks_homework_id"]
      marks.user_id = session[:user_id]
      marks.mark = (params["#{studentid}"]["marks"] != "") ? params["#{studentid}"]["marks"].to_i : 0
      marks.comment = (params["#{studentid}"]["comments"] != "") ? params["#{studentid}"]["comments"].to_s : ""
      #p "Test marks: " + marks.mark.to_s
      if marks.mark
        marks.save
      end
    end
    flash[:success] = "Marks Saved"
    redirect_to marks_path
  end

  # POST /marks
  # POST /marks.json
  def create
    @mark = Mark.new(mark_params)
    @mark.user_id = session[:user_id]
    respond_to do |format|
      if @mark.save
        format.html { redirect_to @mark, notice: 'Mark was successfully created.' }
        format.json { render :show, status: :created, location: @mark }
      else
        format.html { render :new }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marks/1
  # PATCH/PUT /marks/1.json
  def update
    respond_to do |format|
      if @mark.update(mark_params)
        format.html { redirect_to @mark, notice: 'Mark was successfully updated.' }
        format.json { render :show, status: :ok, location: @mark }
      else
        format.html { render :edit }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marks/1
  # DELETE /marks/1.json
  def destroy
    @mark.destroy
    respond_to do |format|
      format.html { redirect_to marks_url, notice: 'Mark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mark
      @mark = Mark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mark_params
      params.require(:mark).permit(:mark, :user_id, :student_id, :subject_id, :comment)
    end
end
