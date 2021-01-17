# frozen_string_literal: true

# class Book describes a Book model
class Book
  include Validator
  @@class_errors = []

  class << self
    def class_errors
      @@class_errors
    end

    def show_errors
      puts "Book class contain not valid items:"
      @@class_errors.each do |item|
        puts "Item with id #{item.object_id} has errors: #{item.errors}"
      end
    end
  end

  attr_reader :title, :author, :errors

  def initialize(title: nil, author: nil)
    @title = title
    @author = author
  end

  def valid?
    if presence.empty? && type.empty? && emptiness.empty? && @author.valid?
      return true
    else
      @@class_errors << self
      @errors = [presence, type, emptiness].flatten.compact
      return false
    end
  end

  private

  def presence
    validate_presence :title, :author
  end

  def type
    [validate_type(String, :title),
    validate_type(Author, :author)].flatten
  end

  def emptiness
    validate_emptiness :title
  end
end
