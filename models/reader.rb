# frozen_string_literal: true

# class Reader describes a Reader model
class Reader
  include Validator

  attr_reader :name, :email, :city, :street, :house, :errors

  def initialize(name: nil, email: nil, city: nil, street: nil, house: nil)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  def valid?
    errors = [presence, type, emptiness, positive].flatten
    if errors.empty?
      return true
    else
      msg = "Object with id #{self.object_id} errors: " + errors.join(', ')
      raise ValidationError, msg
    end
  end

  private

  def presence
    validate_presence :name, :email, :city, :street, :house
  end

  def type
    [validate_type(String, :name, :email, :city, :street),
    validate_type(Integer, :house)].flatten
  end

  def emptiness
    validate_emptiness :name, :email, :city, :street, :house
  end

  def positive
    validate_positive :house
  end
end
