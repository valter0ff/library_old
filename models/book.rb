# frozen_string_literal: true

# class Book describes a Book model
class Book
  include Validator
  attr_reader :title, :author

  def initialize(title: nil, author: nil)
    @title = title
    @author = author
    @errors = []
  end

  def valid?
    [presence?, type?, emptiness?].all?
  end

  private

  def presence?
    validate_presence :title, :author
  end

  def type?
    validate_type String, :title
    validate_type Author, :author
  end

  def emptiness?
    validate_emptiness :title
  end
end
