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

  define_method(:update) do |attributes|
     @name_project = attributes.fetch(:name_project)
     @id = self.id()
     DB.exec("UPDATE projects SET name_project = '#{@name_project}' WHERE id = #{@id};")
   end

  define_method(:delete) do
   DB.exec("DELETE FROM projects WHERE id = #{self.id()};")
  end

  define_singleton_method(:find) do |id|
    found_project = nil
    Projects.all().each() do |project|
      if project.id().==(id)
        found_project = project
      end
    end
    found_project
  end

  def self.find_by_id(id)
    results = DB.exec("SELECT * FROM projects WHERE id = #{id};")
    found_project_hash = results[0]
    found_project_hash
  end

  define_method(:assign) do
    DB.exec("INSERT INTO projects (volunteers_id) VALUES (<%= volunteer.id() %>) WHERE id = #{self.id()}")
  end

end
