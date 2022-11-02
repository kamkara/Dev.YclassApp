json.extract! exercise, :id, :title, :slug, :annonce, :exercise_type, :user_id, :course_id, :created_at, :updated_at
json.url exercise_url(exercise, format: :json)
json.annonce exercise.annonce.to_s
