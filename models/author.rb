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
    errors.empty? ? true : raise(PresenceError, errors)
  end

  def check_class
    errors = validate_class String, :name
    errors.empty? ? true : raise(ClassError, errors)
  end

  def check_emptiness
    errors = validate_emptiness :name
    errors.empty? ? true : raise(EmptinessError, errors)
  end
end
