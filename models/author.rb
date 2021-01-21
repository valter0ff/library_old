class Author
  include Validator

  attr_reader :name, :biography

  def initialize(name: nil, biography: nil)
    @name = name
    @biography = biography
  end

  def validate!
    check_presence
    check_class
    check_emptiness
  end

  private

  def check_presence
    errors = validate_presence :name
    raise PresenceError, errors unless errors.empty?
  end

  def check_class
    errors = validate_class String, :name
    raise ClassError, errors unless errors.empty?
  end

  def check_emptiness
    errors = validate_emptiness :name
    raise EmptinessError, errors unless errors.empty?
  end
end
