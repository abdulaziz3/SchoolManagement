class ChartsController < ApplicationController

  def chart_attendance
    # render json: StudentAttendance.group(:attendance_description_id).group_by_day(:created_at).count
  end

  def chart_student_grades
  end

  def chart_user_roles
  end

  def chart_student_marke_grades
  end

end
