module ApplicationHelper

    def student_signed_in?
      if session[:student_id].nil?
        return
      else
        @current_student = Student.find_by_id(session[:student_id])
      end
    end

    def user_signed_in?
      if session[:user_id].nil?
        return
      else
        @current_user = User.find_by_id(session[:user_id])
      end
    end

    def parent_signed_in?
      if session[:parent_id].nil?
        return
      else
        @current_parent = Parent.find_by_id(session[:parent_id])
      end
    end

    def week_days
      monday to friday
    end

    def time_of_day
      nine to four
    end

end
