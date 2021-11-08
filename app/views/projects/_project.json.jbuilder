json.extract! project, :id, :project_name, :duration, :status, :employee_id, :created_at, :updated_at
json.url project_url(project, format: :json)
