json.extract! student_attendance, :id, :student_id, :attendance_description_id, :date, :created_at, :updated_at
json.url student_attendance_url(student_attendance, format: :json)