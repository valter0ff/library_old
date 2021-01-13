# frozen_string_literal: true

# class Order describes an Order model
class Order
  include Validator
  attr_reader :book, :reader, :date, :errors

  def initialize(book: nil, reader: nil, date: Date.today)
    @book = book
    @reader = reader
    @date = date
  end

  def valid?
    presence? && type? && @book.valid? && @reader.valid?
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
