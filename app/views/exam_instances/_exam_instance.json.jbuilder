json.extract! exam_instance, :id, :title, :exam_date, :min_score, :created_at, :updated_at
json.url exam_instance_url(exam_instance, format: :json)
