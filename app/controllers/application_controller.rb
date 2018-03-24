class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ApplicationHelper
  helper_method :mailbox, :conversation


  def student_authorise
    unless student_signed_in?
      store_location
      redirect_to student_login_path
      flash[:danger] = "Student must sing in to get access"
    end
  end

  def authorised
    unless student_signed_in? || user_signed_in?
      redirect_to root_path
      flash[:danger] = "sign in first"
    end
  end

  def user_authorise
    unless user_signed_in?
      store_location
      redirect_to user_login_path
      flash[:danger] = "Staff must sing in to get access"
    end
  end
  #
  # def parent_authorise
  #   unless parent_signed_in?
  #     store_location
  #     redirect_to parent_login_path
  #     flash[:danger] = "Parent must sing in to get access"
  #   end
  # end

  private

  def mailbox
    @mailbox ||= @current_user.mailbox
  end

  def conversation
    p "Test"
    p params
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def require_admin
    if !user_signed_in? || (user_signed_in? and !@current_user.role == "admin")
      flash[:danger] = "Only admin can perform this action"
      #redirect_to root_path
      redirect_to session[:return_to] || root_path
    end
  end
end
