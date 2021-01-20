class Library
  include Seed
  include Statistics

  DATA_FILE = File.expand_path('../db.yml', __dir__)
  CLASSES = [Integer, String, Date, Author, Book, Library, Order, Reader].freeze
  ADDING_ERROR = "Object cann't be added to library".freeze

  attr_reader :authors, :books, :readers, :orders

  def initialize
    @authors = []
    @books = []
    @readers = []
    @orders = []

    load_from_file!
  end

  def add(entity)
    if entity.is_a?(Author) && entity.valid? then @authors << entity
    elsif entity.is_a?(Book) && entity.valid? then @books << entity
    elsif entity.is_a?(Reader) && entity.valid? then @readers << entity
    elsif entity.is_a?(Order) && entity.valid? then @orders << entity
    else
      raise NotAllowedObject, ADDING_ERROR
    end
  end

  def load_from_file!
    data = YAML.safe_load(File.read(DATA_FILE), CLASSES, [], true) if File.exist?(DATA_FILE)

    return unless data

    @authors = data.authors
    @books = data.books
    @readers = data.readers
    @orders = data.orders
  end

  def store_to_file
    File.open(DATA_FILE, 'w') { |file| file.write(to_yaml) }
  end
end
