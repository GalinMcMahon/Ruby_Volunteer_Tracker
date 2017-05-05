require 'spec_helper.rb'


describe(Projects) do

  describe("#==") do
    it("is the same project if it has the same name") do
      project1 = Projects.new({:description => "Tree Planting"})
      project2 = Projects.new({:description => "Tree Planting"})
      expect(project1).to(eq(project2))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Projects.all()).to(eq([]))
    end
  end

  # describe("#name_project") do
  #   it("lets you see existing project") do
  #     test_project = Projects.new({:name_project => "Field Mowing", :id => nil})
  #     expect(test_project.name_project()).to(eq("Field Mowing"))
  #   end
  # end




  # describe('#save') do
  #   it("creates a new project in the volunteer_tracker database") do
  #     test_project = Projects.new()
  #     test_project.save
  #     found_DB_objects = DB.exec("SELECT * FROM projects WHERE name_project = 'Field Mowing';")
  #     expect(found_DB_objects[0]["name_project"]).to(eq('Field Mowing'))
  #   end
  # end
end
