xml.instruct!
xml.projects do 
    xml.project_title @project.project_name
    xml.duration @project.duration
    xml.status @project.status
end