# frozen_string_literal: true

require_relative 'autoload'
require 'pry-byebug'
require 'awesome_print'

reader1 = Reader.new(name: 22, email: "@sabaka", street: "", house: -10)

author1 = Author.new(name: "Boris Akunin")
author2 = Author.new(name: "", biography: "some bio")

book1 = Book.new(title: "BEloe solnce", author: author1)
book2 = Book.new(title: "", author: "Djek Vorobey")

order1 = Order.new(book: book2)

p reader1.valid?
p author2.valid?
p author1.valid?
p book1.valid?
p book2.valid?
p order1.valid?

reader1.errors
author1.errors
author2.errors
book2.errors
order1.errors

binding.pry
p
