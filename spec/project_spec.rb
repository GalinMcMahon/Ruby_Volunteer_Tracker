require 'spec_helper.rb'


describe(Projects) do

  describe("#==") do
    it("is the same project if it has the same name") do
      project1 = Projects.new({:name_project => "Tree Planting", :id => nil})
      project2 = Projects.new({:name_project => "Tree Planting", :id => nil})
      expect(project1).to(eq(project2))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Projects.all()).to(eq([]))
    end
  end

  describe("#name_project") do
    it("lets you see existing project") do
      test_project = Projects.new({:id => nil, :name_project => "Field Mowing"})
      expect(test_project.name_project()).to(eq("Field Mowing"))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_project = Projects.new({:id => nil, :name_project => "Field Mowing"})
      test_project.save()
      expect(Projects.all()).to(eq([test_project]))
    end
  end

  describe("#update") do
      it("lets you update project names") do
        project = Projects.new({:id => nil, :name_project => "Field Mowing"})
        project.save()
        project.update({:name_project => "Weed Pulling"})
        expect(project.name_project()).to(eq("Weed Pulling"))
      end
    end


end
