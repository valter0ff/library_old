class Book
  include Validator

  attr_reader :title, :author

  def initialize(title: nil, author: nil)
    @title = title
    @author = author
  end

  def validate!
    check_presence
    check_class
    check_emptiness
    @author.validate!
  end

  private

  def check_presence
    errors = validate_presence :title, :author
    raise PresenceError, errors unless errors.empty?
  end

  def check_class
    errors = [validate_class(String, :title),
              validate_class(Author, :author)].flatten
    raise ClassError, errors unless errors.empty?
  end

  def check_emptiness
    errors = validate_emptiness :title
    raise EmptinessError, errors unless errors.empty?
  end
end
