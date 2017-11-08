class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ApplicationHelper

  def student_authorise
    unless student_signed_in?
      store_location
      redirect_to student_login_path
      flash[:danger] = "'Students' must sign in to get access"
    end
  end

  def user_authorise
    unless user_signed_in?
      store_location
      redirect_to user_login_path
      flash[:danger] = "'Users' must sign in to get access"
    end
  end

private

  def store_location
    session[:return_to] = request.fullpath
  end
end

  def require_admin
    if !user_signed_in? || (user_signed_in? and !@current_user.role == "admin")
      flash[:danger] = "Only admins can perform that action"
      #redirect_to root_path
      redirect_to session[:return_to] || root_path
    end
  end
