class Student < Person
  def initialize(classroom, age, _name = 'Unknown', _parent_permission: true)
    # rubocop:disable all
    super(age, name = 'Unknown', parent_permission = true)
    @classroom = classroom
  end
  #rubocop:enable
  def play_hooky()
    '¯(ツ)/¯'
  end
end
