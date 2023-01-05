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

class baseDecorator < Nameable
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def correct_name
    @name.correct_name
  end
end

def is_of_age(age)
  #rubocop:enable
  age > 18
end
