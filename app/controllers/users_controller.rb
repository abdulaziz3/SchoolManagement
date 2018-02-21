class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :user_authorise, only: [:update, :edit]
  before_action :require_admin, only: [:destroy]
  before_filter :require_admin, :only => [:destroy]
  before_action :authorised, only: [:show, :index]

  def index
    @users = User.paginate(page: params[:page], per_page: 15)
  end

  def show
    @user  = User.find(params[:id])
  end

  def search
      @users = User.paginate(page: params[:page], per_page: 15).search params[:query]
      unless @users.empty?
        render 'index'
      else
        flash[:danger] = "NO Teacher were found"
        @user = User.all
        render 'index'
      end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #UserMailer.welcome(@user).deliver_now
      session[:user_id] = @user.id
      flash[:success] = "Welcom to the School Management System #{@user.f_name}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User was successfully updated"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User was successfully delete"
    redirect_to user_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:f_name, :l_name, :email, :dob, :password, :password_confirmation, :nationality, :national_id, :gender, :role_id)
    end
end
