class Projects

  attr_reader(:name_project)

  define_method(:initialize) do |name_project|
    @name_project = name_project
  end

  define_method(:==) do |other|
    same_class = self.class().eql?(other.class())
    same_name_project = self.name_project().eql?(other.name_project())
    same_class.&(same_name_project)
  end

  define_singleton_method(:all) do
  returned_projects = DB.exec("SELECT * FROM projects;")
  projects = []
  returned_projects.each() do |task|
    description = task.fetch("name_project")
    projects.push(Projects.new({:name_project => name_project}))
  end
  projects
  end



end
