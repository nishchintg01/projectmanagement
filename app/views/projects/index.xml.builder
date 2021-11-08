xml.instruct!
xml.projects do
  @projects.each do |project|
    xml.project do
      xml.project_title project.project_name
      xml.duration project.duration
      xml.status project.status
      xml.assigned_to project.employee.name
    end
  end
end