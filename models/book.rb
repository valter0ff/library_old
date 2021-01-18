# frozen_string_literal: true

# class Book describes a Book model
class Book
  include Validator

  attr_reader :title, :author, :errors

  def initialize(title: nil, author: nil)
    @title = title
    @author = author
  end

  def valid?
    errors = [presence, type, emptiness].flatten
    if errors.empty? && @author.valid?
      return true
    else
      msg = "Object with id #{self.object_id} errors: " + errors.join(', ')
      raise ValidationError, msg
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
