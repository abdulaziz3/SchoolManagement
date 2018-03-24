class ChartsController < ApplicationController

  def chart_attendance
    @attendance = StudentAttendance.joins(:attendance_description).group(:att_status).group_by_day(:date, format: "%a %d-%m-%Y").count
    # p @attendance
    @test = StudentAttendance.joins(:attendance_description).where("att_status = ?", "Absent").group_by_day(:date, format: "%a %d-%m-%Y").count
    p "Test here"
    p @test
  end

  def chart_student_grades

  end

  def chart_user_roles
  end

  def chart_student_marke_grades
  end

end
