class Volunteers

  attr_accessor(:name_volunteer, :id)

  define_method(:initialize) do |attributes|
    @name_volunteer = attributes.fetch(:name_volunteer)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
  returned_volunteers = DB.exec("SELECT * FROM volunteers;")
  volunteers = []
  returned_volunteers.each() do |volunteer|
    name_volunteer = volunteer.fetch("name_volunteer")
    id = volunteer.fetch("id").to_i()
    volunteers.push(Volunteers.new({:id => id, :name_volunteer => name_volunteer}))
  end
  volunteers
  end

  define_method(:==) do |other|
    same_class = self.class().eql?(other.class())
    same_name_volunteer = self.name_volunteer().eql?(other.name_volunteer())
    same_class.&(same_name_volunteer)
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO volunteers (name_volunteer) VALUES ('#{@name_volunteer}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:update) do |attributes|
     @name_volunteer = attributes.fetch(:name_volunteer)
     @id = self.id()
     DB.exec("UPDATE volunteers SET name_volunteer = '#{@name_volunteer}' WHERE id = #{@id};")
  end

  define_method(:delete) do
   DB.exec("DELETE FROM volunteers WHERE id = #{self.id()};")
  end

  define_singleton_method(:available) do
    available_volunteers = DB.exec("SELECT * FROM volunteers;")
    available_arr = []
    available_volunteers.each() do |volunteer|
      name_volunteer = volunteer.fetch("name_volunteer")
      id = volunteer.fetch("id").to_i()
      projects_id = volunteer.fetch("projects_id").to_i()
      if projects_id <=1
        available_arr.push(Volunteers.new({:id => id, :name_volunteer => name_volunteer, :projects_id => projects_id}))
           binding.pry
      else
        @id = available_arr[1]["id"].to_i
      end
      available_arr
    end
  end
end
