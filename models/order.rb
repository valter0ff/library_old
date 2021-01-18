class Order
  include Validator

  attr_reader :book, :reader, :date

  def initialize(book: nil, reader: nil, date: Date.today)
    @book = book
    @reader = reader
    @date = date
  end

  def valid?
    errors = [presence, type].flatten
    return true if errors.empty? && @book.valid? && @reader.valid?

    msg = "Object with id #{object_id} errors: " + errors.join(', ')
    raise ValidationError, msg
  end

  private

  def presence
    validate_presence :book
  end

  def type
    [validate_type(Book, :book),
     validate_type(Reader, :reader),
     validate_type(Date, :date)].flatten
  end
end
