class ParentsController < ApplicationController
  before_action :set_parent, only: [:show, :edit, :update, :destroy]

  # GET /parents
  # GET /parents.json
  def index
    @parents = Parent.all
  end

  # GET /parents/1
  # GET /parents/1.json
  def show
    @parent = Parent.find(params[:id])
  end

  # GET /parents/new
  def new
    @parent = Parent.new
  end

  # GET /parents/1/edit
  def edit
  end

  # POST /parents
  # POST /parents.jsondef new
  def create
    @parent = Parent.new(parent_params)
    if @parent.save
      session[:parent_id] = @parent.id
      flash[:success] = "welcom to the system #{@parent.f_name}"
      redirect_to parent_path(@parent)
    else
      render 'new'
    end
  end

  # PATCH/PUT /parents/1
  # PATCH/PUT /parents/1.json
  def update
    respond_to do |format|
      if @parent.update(parent_params)
        format.html { redirect_to @parent, notice: 'Parent was successfully updated.' }
        format.json { render :show, status: :ok, location: @parent }
      else
        format.html { render :edit }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parents/1
  # DELETE /parents/1.json
  def destroy
    @parent = Parent.find(params[:id])
    @parent.destroy
    flash[:danger] = "Parent was successfully deleted"
    redirect_to parent_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent
      @parent = Parent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parent_params
      params.require(:parent).permit(:f_name, :l_name, :phone, :dob, :job, :work_phone, :password, :password_confirmation, :email)
    end
end
