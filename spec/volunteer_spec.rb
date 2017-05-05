require 'spec_helper.rb'


describe(Volunteers) do

  describe("#==") do
    it("is the same volunteer if it has the same name") do
      volunteer1 = Volunteers.new({:name_volunteer => "Bob Jones", :id => nil})
      volunteer2 = Volunteers.new({:name_volunteer => "Bob Jones", :id => nil})
      expect(volunteer1).to(eq(volunteer2))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Volunteers.all()).to(eq([]))
    end
  end

  describe("#name_volunteer") do
    it("lets you see existing volunteer") do
      test_volunteer = Volunteers.new({:id => nil, :name_volunteer => "Sally Smith"})
      expect(test_volunteer.name_volunteer()).to(eq("Sally Smith"))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_volunteer = Volunteers.new({:id => nil, :name_volunteer => "Sally Smith"})
      test_volunteer.save()
      expect(Volunteers.all()).to(eq([test_volunteer]))
    end
  end

  describe("#update") do
      it("lets you update volunteer names") do
        volunteer = Volunteers.new({:id => nil, :name_volunteer => "Sally Smith"})
        volunteer.save()
        volunteer.update({:name_volunteer => "Weed Pulling"})
        expect(volunteer.name_volunteer()).to(eq("Weed Pulling"))
      end
    end

  # describe("#delete") do
  #     it("lets you delete a volunteer from the database") do
  #       volunteer = Volunteers.new({:name_volunteer => "Weed Pulling", :id => nil})
  #       volunteer.save()
  #       volunteer2 = Volunteers.new({:name_volunteer => "Car Wash", :id => nil})
  #       volunteer2.save()
  #       volunteer.delete()
  #       expect(Volunteers.all()).to(eq([volunteer2]))
  #     end
  #   end

end
