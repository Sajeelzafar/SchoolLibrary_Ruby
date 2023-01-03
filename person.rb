class Person
    def initialize(age, name = "Unknown", parent_permission = true)
        @id = Random.rand(1..1000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    attr_reader :name
    attr_writer :name
    attr_reader :age
    attr_writer :age
    attr_reader :id
    attr_reader :parent_permission

    def can_use_services(age, parent_permission)
        (age>18 || parent_permission===true) ? true : false
    end

    private
    
    def is_of_age(age)
    end
end

def is_of_age(age)
    age>18 ? true : false
end
