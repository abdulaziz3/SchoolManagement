class StudentAttendance < ActiveRecord::Base
  belongs_to :student
  belongs_to :attendance_description

  def self.searchAttendance(params)
    textQuery = params[:attendQuery]
    gradeQuery = params[:attendGradeQuery]
    dateQuery = params[:attendDateQuery]
    p "dateQuery"
    p dateQuery
    if(textQuery && textQuery.length > 0)
      whereClause = "(f_name LIKE '%" + textQuery + "%' OR l_name LIKE '%" + textQuery + "%')"
    end

    if(dateQuery && dateQuery.to_s.length > 0)
      if(whereClause)
        whereClause = whereClause + "AND (date = '" + dateQuery.to_s + "')"
      else
        whereClause = "(date = '" + dateQuery.to_s + "')"
      end
    end

    if(gradeQuery && gradeQuery.length > 0)
      if(whereClause)
        whereClause = whereClause + "AND (grade_id = '" + gradeQuery + "')"
      else
        whereClause = "(grade_id = '" + gradeQuery + "')"
      end
    end

    joins(:student).where(whereClause)
	end

  def self.checkAttendance(query)
    todaysDate = Date.today
    joins(:student).where("grade_id = ? && date LIKE ?", "#{query}", "%#{todaysDate}%")
	end
end
