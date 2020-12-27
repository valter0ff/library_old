# frozen_string_literal: true

# class Order describes an Order model
class Order
  include Validator
  attr_reader :book, :reader, :date

# strftime("%B %d, %Y")
  def initialize(book: nil, reader: nil, date: Date.today)
    @book = book
    @reader = reader
    @date = date
    @errors = []
  end

  def valid?
    [presence?, type?].all?
  end

  private

  def presence?
    validate_presence :book
  end

  def type?
    validate_type Book, :book
    validate_type Reader, :reader
    validate_type Date, :date
  end
end
