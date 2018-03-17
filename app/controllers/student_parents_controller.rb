class StudentParentsController < ApplicationController
  before_action :set_student_parent, only: [:show, :edit, :update, :destroy]

  # GET /student_parents
  # GET /student_parents.json
  def index
    @student_parents = StudentParent.all
  end

  # GET /student_parents/1
  # GET /student_parents/1.json
  def show
  end

  # GET /student_parents/new
  def new
    @student_parent = StudentParent.new
    User.all.each do |users|
      @user_role_parent = users.role.to_s == "parent"
    end
  end

  # GET /student_parents/1/edit
  def edit
  end

  # POST /student_parents
  # POST /student_parents.json
  def create
    @student_parent = StudentParent.new(student_parent_params)

    respond_to do |format|
      if @student_parent.save
        format.html { redirect_to @student_parent, notice: 'Student parent was successfully created.' }
        format.json { render :show, status: :created, location: @student_parent }
      else
        format.html { render :new }
        format.json { render json: @student_parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_parents/1
  # PATCH/PUT /student_parents/1.json
  def update
    respond_to do |format|
      if @student_parent.update(student_parent_params)
        format.html { redirect_to @student_parent, notice: 'Student parent was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_parent }
      else
        format.html { render :edit }
        format.json { render json: @student_parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_parents/1
  # DELETE /student_parents/1.json
  def destroy
    @student_parent.destroy
    respond_to do |format|
      format.html { redirect_to student_parents_url, notice: 'Student parent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_parent
      @student_parent = StudentParent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_parent_params
      params.require(:student_parent).permit(:user_id, :student_id)
    end
end
