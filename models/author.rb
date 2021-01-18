class Author
  include Validator

  attr_reader :name, :biography

  def initialize(name: nil, biography: nil)
    @name = name
    @biography = biography
  end

  def valid?
    errors = [presence, type, emptiness].flatten
    return true if errors.empty?

    msg = "Object with id #{object_id} errors: " + errors.join(', ')
    raise ValidationError, msg
  end

  private

  def presence
    validate_presence :name
  end

  def type
    validate_type String, :name
  end

  def emptiness
    validate_emptiness :name
  end
end
