# frozen_string_literal: true

# class Author describes an Author model
class Author
  include Validator
  attr_reader :name, :biography

  def initialize(name: nil, biography: nil)
    @name = name
    @biography = biography
    @errors = []
  end

  def valid?
    [presence?, type?, emptiness?].all?
  end

  private

  def presence?
    validate_presence :name
  end

  def type?
    validate_type String, :name
  end

  def emptiness?
    validate_emptiness :name
  end
end
