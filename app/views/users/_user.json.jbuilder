json.extract! user, :id, :f_name, :l_name, :email, :dob, :password_digest, :nationality, :national_id, :gender, :created_at, :updated_at
json.url user_url(user, format: :json)