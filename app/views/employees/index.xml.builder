xml.instruct!
xml.project_management do
  @employees.each do |employee|
    xml.employee do
      xml.name employee.name
      xml.email employee.email
      xml.age employee.age
      xml.phone_no employee.phone
      xml.employee_id employee.emp_id
      xml.designation employee.designation
        xml.projects_list do
          employee.projects.each do |project|
            xml.project do
              xml.project project.project_name
              xml.duration project.duration
              xml.status project.status
            end
          end
        end
    end
  end
end