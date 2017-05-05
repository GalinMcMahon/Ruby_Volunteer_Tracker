class Volunteers

  attr_reader(:name_volunteer)

  define_method(:initialize) do |attributes|
    @name_volunteer = attributes.fetch(:name_volunteer)
    @id = attributes.fetch(:id)
  end

  define_method(:==) do |other|
    same_class = self.class().eql?(other.class())
    same_name_volunteer = self.name_volunteer().eql?(other.name_volunteer())
    same_class.&(same_name_volunteer)
  end







end
