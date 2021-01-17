# frozen_string_literal: true

# class Reader describes a Reader model
class Reader
  include Validator
  @@class_errors = []

  class << self
    def class_errors
      @@class_errors
    end

    def show_errors
      puts "Reader class contain not valid items:"
      @@class_errors.each do |item|
        puts "Item with id #{item.object_id} has errors: #{item.errors}"
      end
    end
  end

  attr_reader :name, :email, :city, :street, :house, :errors

  def initialize(name: nil, email: nil, city: nil, street: nil, house: nil)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  def valid?
    if presence.empty? && type.empty? && emptiness.empty? && positive.empty?
      return true
    else
      @@class_errors << self
      @errors = [presence, type].flatten.compact
      return false
    end
  end

  #private

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
