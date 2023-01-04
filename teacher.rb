class Teacher < Person
  # rubocop:disable all
  def initialize(specialization, age, _name = 'Unknown', _parent_permission: true)
    super(age, name = 'Unknown', parent_permission = true)
    # rubocop:enable
    @specialization = specialization
  end

  def can_use_services()
    true
  end
end
