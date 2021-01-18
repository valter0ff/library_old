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

lib = Library.new

begin
  lib.add(reader1)
rescue ValidationError => e
  puts e.message
end

begin
  lib.add(reader2)
rescue ValidationError => e
  puts e.message
end

begin
  lib.add(author1)
rescue ValidationError => e
  puts e.message
end

begin
  lib.add(author2)
rescue ValidationError => e
  puts e.message
end

begin
  lib.add(book1)
rescue ValidationError => e
  puts e.message
end

begin
  lib.add(book2)
rescue ValidationError => e
  puts e.message
end

begin
  lib.add(order1)
rescue ValidationError => e
  puts e.message
end

begin
  lib.add(order2)
rescue ValidationError => e
  puts e.message
end

lib.store_to_file


lib1 = Library.new
lib1.generate_data
puts lib1.top_readers
puts lib1.top_books
puts lib1.number_readers_of_top_books

binding.pry
p
