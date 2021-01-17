# frozen_string_literal: true

require_relative 'autoload'
require 'pry-byebug'
require 'awesome_print'

reader1 = Reader.new(name: 22, email: "@sabaka", street: "", house: -10)
reader2 = Reader.new(name: 'Mark', email: "markus@gmail.com", city: 'London', street: 'Bayker', house: 21)
author1 = Author.new(name: "Boris Akunin")
author2 = Author.new(name: '', biography: "some bio")
book1 = Book.new(title: "BEloe solnce", author: author1)
book2 = Book.new(title: "", author: "Djek Vorobey")
order1 = Order.new(book: book2, reader: reader1)
order2 = Order.new(book: book1, reader: reader2)


p reader1.valid?
p reader2.valid?
p author2.valid?
p author1.valid?
p book1.valid?
p book2.valid?
p order1.valid?

lib = Library.new
lib.add(reader1)
lib.add(reader2)
lib.add(author1)
lib.add(author2)
lib.add(book1)
lib.add(book2)
lib.add(order1)
lib.add(order2)
lib.store_to_file


lib1 = Library.new
lib1.generate_data
#lib1.store_to_file

binding.pry
p
