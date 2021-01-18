# frozen_string_literal: true

# class Author describes an Author model
class Author
  include Validator

  attr_reader :name, :biography, :errors

  def initialize(name: nil, biography: nil)
    @name = name
    @biography = biography
  end

  def valid?
    errors = [presence, type, emptiness].flatten
    if errors.empty?
      return true
    else
      msg = "Object with id #{self.object_id} errors: " + errors.join(', ')
      raise ValidationError, msg
    end
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
