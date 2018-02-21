class StudentAttendancesController < ApplicationController
  before_action :set_student_attendance, only: [:show, :edit, :update, :destroy]

  # GET /student_attendances
  # GET /student_attendances.json
  def index
    @student_attendances = StudentAttendance.paginate(page: params[:page], per_page: 25)
  end

  # GET /student_attendances/1
  # GET /student_attendances/1.json
  def show
  end

  # GET /student_attendances/new
  def new
    @gradeValue = params["gradeValue"]
    @student_attendance = StudentAttendance.new

    @showAttendance = false
    if @gradeValue then
      @todaysAttendance = StudentAttendance.checkAttendance params[:gradeValue]
      #p "Test Count: " + @todaysAttendance.count.to_s
      if(@todaysAttendance.count > 0)
        flash[:danger] = "Attendance already taken"
        @showAttendance = false
      else
        @showAttendance = true
      end
    end
    @students = Student.all
    @att_desc = AttendanceDescription.all
  end

  def searchAttendance
    @student_attendances = StudentAttendance.paginate(page: params[:page], per_page: 25).searchAttendance params[:attendQuery]
    unless @student_attendances.empty?
      render 'index'
    else
      flash[:danger] = "NO Student were found"
      @student_attendances = StudentAttendance.paginate(page: params[:page], per_page: 25)
      render 'index'
    end
  end

  # GET /student_attendances/1/edit
  def edit
  end

  def saveAttendance
    @students = Student.all
    @students.each do |student|
      studentid = student.id
      attendance = StudentAttendance.new
      attendance.student_id = student.id
      attendance.attendance_description_id = params["#{studentid}"]
      attendance.date = Date.civil(*params[:date].sort.map(&:last).map(&:to_i))
      if attendance.attendance_description_id then
        attendance.save
      end
    end
    flash[:success] = "Attendance Saved"
    redirect_to student_attendances_path
  end

  # POST /student_attendances
  # POST /student_attendances.json
  def create
    @student_attendance = StudentAttendance.new(student_attendance_params)

    respond_to do |format|
      if @student_attendance.save
        format.html { redirect_to @student_attendance, notice: 'Student attendance was successfully created.' }
        format.json { render :show, status: :created, location: @student_attendance }
      else
        format.html { render :new }
        format.json { render json: @student_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_attendances/1
  # PATCH/PUT /student_attendances/1.json
  def update
    respond_to do |format|
      if @student_attendance.update(student_attendance_params)
        format.html { redirect_to @student_attendance, notice: 'Student attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_attendance }
      else
        format.html { render :edit }
        format.json { render json: @student_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_attendances/1
  # DELETE /student_attendances/1.json
  def destroy
    @student_attendance.destroy
    respond_to do |format|
      format.html { redirect_to student_attendances_url, notice: 'Student attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_attendance
      @student_attendance = StudentAttendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_attendance_params
      params.require(:student_attendance).permit(:student_id, :attendance_description_id, :date)
    end
end
