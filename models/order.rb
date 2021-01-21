class Order
  include Validator

  attr_reader :book, :reader, :date

  def initialize(book: nil, reader: nil, date: Date.today)
    @book = book
    @reader = reader
    @date = date
  end

  def validate!
    check_presence
    check_class
    @book.validate!
    @reader.validate!
  end

  private

  def check_presence
    errors = validate_presence :book
    raise PresenceError, errors unless errors.empty?
  end

  def check_class
    errors = [validate_class(Book, :book),
              validate_class(Reader, :reader),
              validate_class(Date, :date)].flatten
    raise ClassError, errors unless errors.empty?
  end
end
