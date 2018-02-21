class AttendanceDescriptionsController < ApplicationController
  before_action :set_attendance_description, only: [:show, :edit, :update, :destroy]

  # GET /attendance_descriptions
  # GET /attendance_descriptions.json
  def index
    @attendance_descriptions = AttendanceDescription.all
  end

  # GET /attendance_descriptions/1
  # GET /attendance_descriptions/1.json
  def show
  end

  # GET /attendance_descriptions/new
  def new
    @attendance_description = AttendanceDescription.new
  end

  # GET /attendance_descriptions/1/edit
  def edit
  end

  # POST /attendance_descriptions
  # POST /attendance_descriptions.json
  def create
    @attendance_description = AttendanceDescription.new(attendance_description_params)

    respond_to do |format|
      if @attendance_description.save
        format.html { redirect_to @attendance_description, notice: 'Attendance description was successfully created.' }
        format.json { render :show, status: :created, location: @attendance_description }
      else
        format.html { render :new }
        format.json { render json: @attendance_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendance_descriptions/1
  # PATCH/PUT /attendance_descriptions/1.json
  def update
    respond_to do |format|
      if @attendance_description.update(attendance_description_params)
        format.html { redirect_to @attendance_description, notice: 'Attendance description was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance_description }
      else
        format.html { render :edit }
        format.json { render json: @attendance_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendance_descriptions/1
  # DELETE /attendance_descriptions/1.json
  def destroy
    @attendance_description.destroy
    respond_to do |format|
      format.html { redirect_to attendance_descriptions_url, notice: 'Attendance description was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance_description
      @attendance_description = AttendanceDescription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_description_params
      params.require(:attendance_description).permit(:att_status)
    end
end
