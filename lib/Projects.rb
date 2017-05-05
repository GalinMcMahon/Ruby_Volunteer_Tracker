class Projects

  attr_reader(:name_project, :id)

  define_method(:initialize) do |attributes|
    @name_project = attributes.fetch(:name_project)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
  returned_projects = DB.exec("SELECT * FROM projects;")
  projects = []
  returned_projects.each() do |project|
    name_project = project.fetch("name_project")
    id = project.fetch("id").to_i()
    projects.push(Projects.new({:id => id, :name_project => name_project}))
  end
  projects
  end

  define_method(:==) do |other|
    same_class = self.class().eql?(other.class())
    same_name_project = self.name_project().eql?(other.name_project())
    same_class.&(same_name_project)
  end

  define_method(:save) do
  result = DB.exec("INSERT INTO projects (name_project) VALUES ('#{@name_project}') RETURNING id;")
  @id = result.first().fetch("id").to_i()
  end



end
