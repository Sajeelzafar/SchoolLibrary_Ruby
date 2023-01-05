class Nameable
  def correct_name
    raise NotImplementedError
  end
end

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
  end

  attr_accessor :name, :age
  attr_reader :id, :parent_permission

  def can_use_services(age, parent_permission)
    age > 18 || parent_permission == true
  end

  def correct_name
    @name
  end

  private

  # rubocop:disable all
  def is_of_age(age); end
end 

class BaseDecorator < Nameable
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def correct_name
    @name.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @name.correct_name.upcase
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    @name.correct_name.slice!(0...10)
  end
end

def is_of_age(age)
  #rubocop:enable
  age > 18
end

person = Person.new(22, 'maximilianus')
p person.correct_name
capitalizedPerson = CapitalizeDecorator.new(person)
p capitalizedPerson.correct_name
capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
p capitalizedTrimmedPerson.correct_name
