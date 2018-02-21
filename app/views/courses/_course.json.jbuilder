json.extract! course, :id, :course_name, :start_date, :end_date, :current_course, :created_at, :updated_at
json.url course_url(course, format: :json)