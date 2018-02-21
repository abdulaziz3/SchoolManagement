json.extract! homework, :id, :homework_name, :description, :marking, :user_id, :subject_id, :created_at, :updated_at
json.url homework_url(homework, format: :json)