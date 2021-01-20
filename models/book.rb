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
    errors.empty? ? true : raise(PresenceError, errors)
  end

  def check_class
    errors = [validate_class(String, :title),
              validate_class(Author, :author)].flatten
    errors.empty? ? true : raise(ClassError, errors)
  end

  def check_emptiness
    errors = validate_emptiness :title
    errors.empty? ? true : raise(EmptinessError, errors)
  end
end
