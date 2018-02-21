class SessionsController < ApplicationController
  def new
  end

  def create
    student = Student.find_by(email: params[:session][:email].downcase)
    if student && student.authenticate(params[:session][:password])
      session[:student_id] = student.id
      flash[:success] = "Welcom back"
      redirect_to session[:return_to] || root_path
    else
      flash[:danger] = "Invalid email / password"
      render 'new'
    end
  end

  def destroy
    if student_signed_in?
      session[:student_id] = nil
    else
      flash[:notice] = "You need to sign in"
    end
    redirect_to root_path
  end

  def usernew
  end

  def usercreate
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcom back"
      redirect_to session[:return_to] || root_path
    else
      flash[:danger] = "invalid email / password"
      render 'new'
    end
  end

  def userdestroy
    if user_signed_in?
      session[:user_id] = nil
    else
      flash[:notice] = "You need to sign in"
  end
  redirect_to root_path
end

def parentnew
end

def parentcreate
  parent = Parent.find_by(email: params[:session][:email].downcase)
  if parent && parent.authenticate(params[:session][:password])
    session[:parent_id] = parent.id
    flash[:success] = "Welcom back"
    redirect_to session[:return_to] || root_path
  else
    flash[:danger] = "Invalid email / password"
    render 'new'
  end
end

def parentdestroy
  if parent_signed_in?
    session[:parent_id] = nil
  else
    flash[:notice] = "You need to sign in"
  end
  redirect_to root_path
end

end
