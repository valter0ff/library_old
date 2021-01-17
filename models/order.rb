# frozen_string_literal: true

# class Order describes an Order model
class Order
  include Validator
  @@class_errors = []

  class << self
    def class_errors
      @@class_errors
    end

    def show_errors
      puts "Order class contain not valid items:"
      @@class_errors.each do |item|
        puts "Item with id #{item.object_id} has errors: #{item.errors}"
      end
    end
  end

  attr_reader :book, :reader, :date, :errors

  def initialize(book: nil, reader: nil, date: Date.today)
    @book = book
    @reader = reader
    @date = date
  end

  def valid?
    if presence.empty? && type.empty? && @book.valid? && @reader.valid?
      return true
    else
      @@class_errors << self
      @errors = [presence, type].flatten.compact
      return false
    end
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
