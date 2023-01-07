class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def new_student(student)
    @students.push(student)
    student.classroom = self
  end
end
