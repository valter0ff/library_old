class Book
  include Validator

  attr_reader :title, :author

  def initialize(title: nil, author: nil)
    @title = title
    @author = author
  end

  def valid?
    errors = [presence, type, emptiness].flatten
    return true if errors.empty? && @author.valid?

    msg = "Object with id #{object_id} errors: " + errors.join(', ')
    raise ValidationError, msg
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
