json.extract! employee, :id, :name, :email, :age, :phone, :emp_id, :designation, :created_at, :updated_at
json.url employee_url(employee, format: :json)
