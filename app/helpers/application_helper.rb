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

#    def gravatar_for(student, option = {size: 80})
#      gravatar_id = Digest::MD5::hexdigest(student.email.downcase)
#      size = option[:size]
#      gravatar_url = "https://secure.gravatar.comm/avatar/#{gravatar_id}?s=#{size}"
#      image_tag(gravatar_url, alt: student.email, class: "img-circle")
#    end

end
