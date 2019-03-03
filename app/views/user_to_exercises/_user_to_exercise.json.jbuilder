json.extract! user_to_exercise, :id, :user_id, :exercise_id, :created_at, :updated_at
json.url user_to_exercise_url(user_to_exercise, format: :json)
