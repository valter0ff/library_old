# frozen_string_literal: true

# class Author describes an Author model
class Author
  include Validator
  @@class_errors = []

  class << self
    def class_errors
      @@class_errors
    end

    def show_errors
      puts "Author class contain not valid items:"
      @@class_errors.each do |item|
        puts "Item with id #{item.object_id} has errors: #{item.errors}"
      end
    end
  end

  attr_reader :name, :biography, :errors

  def initialize(name: nil, biography: nil)
    @name = name
    @biography = biography
  end

  def valid?
    if presence.empty? && type.empty? && emptiness.empty?
      return true
    else
      @@class_errors << self
      @errors = [presence, type, emptiness].flatten.compact
      return false
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
