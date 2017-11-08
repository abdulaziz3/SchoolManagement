json.extract! subject, :id, :subject_name, :subject_code, :created_at, :updated_at
json.url subject_url(subject, format: :json)