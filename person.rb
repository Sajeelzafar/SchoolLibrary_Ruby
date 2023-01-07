class Nameable
  def correct_name
    raise NotImplementedError
  end
end

class Person < Nameable
  attr_reader :rentals, :id, :parent_permission

  def initialize(age, name, parent_permission)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_accessor :name, :age

  def can_use_services(age, parent_permission)
    age > 18 || parent_permission == true
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
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
