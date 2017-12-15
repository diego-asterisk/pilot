json.extract! student, :id, :email, :last_name, :first_name, :document_number, :docket_number, :grade_id, :created_at, :updated_at
json.url student_url(student, format: :json)
