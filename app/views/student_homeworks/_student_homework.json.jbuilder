json.extract! student_homework, :id, :student_id, :homework_id, :created_at, :updated_at
json.url student_homework_url(student_homework, format: :json)