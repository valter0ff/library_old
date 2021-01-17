# frozen_string_literal: true

# class Reader describes a Reader model
class Library
  include Seed

  DATA_FILE = File.expand_path('../db.yml', __dir__)
  CLASSES = [Integer, String, Date, Author, Book, Library, Order, Reader].freeze

  attr_reader :authors, :books, :readers, :orders

  def initialize
    @authors = []
    @books = []
    @readers = []
    @orders = []

    load_from_file!
  end

  def uniq?(entity)
    check = instance_variables.detect do |var|
      instance_variable_get(var).include?(entity)
    end
    check.nil?
  end

  def author_uniq?(entity)
    @authors.none? { |author| author.name == entity.name }
  end

  def book_uniq?(entity)
    @books.none? { |book| book.title == entity.title }
  end

  def reader_uniq?(entity)
    @readers.none? { |reader| reader.name == entity.name }
  end

  def order_uniq?(entity)
    @orders.none? do |order|
      order.reader.name == entity.reader.name &&
        order.book.title == entity.book.title &&
        order.date == entity.date
    end
  end

  def can_add?(entity)
    entity.valid? && uniq?(entity)
  end

  def add(entity)
    return unless can_add?(entity)

    if entity.is_a?(Author) && author_uniq?(entity) then @authors << entity
    elsif entity.is_a?(Book) && book_uniq?(entity) then @books << entity
    elsif entity.is_a?(Reader) && reader_uniq?(entity) then @readers << entity
    elsif entity.is_a?(Order) && order_uniq?(entity) then @orders << entity
    end
  end

  def load_from_file!
    data = YAML.safe_load(File.read(DATA_FILE), CLASSES, [], true) if File.exist?(DATA_FILE)

    return unless data

    data.instance_variables.each do |var|
      data.instance_variable_get(var).map { |entity| add(entity) }
    end
  end

  def store_to_file
    File.open(DATA_FILE, 'w') { |file| file.write(to_yaml) }
  end
end
