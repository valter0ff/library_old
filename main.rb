require_relative 'autoload'
require 'pry-byebug'


  reader1 = Reader.new(name: 22, email: "@sabaka", street: "", house: -10)
    
  author1 = Author.new(name: "Boris Akunin")
  author2 = Author.new(name: "")
  
  book1 = Book.new(title: "BEloe solnce", author: author1)
  book2 = Book.new(title: "", author: "Djek Vorobey")
  
  p reader1.valid?
  p author2.valid?
  p author1.valid?
  p book1.valid?
  p book2.valid?
  
  reader1.errors
  author2.errors
  book2.errors
  
  p author1.name
  p book1.title
  p book1.author
  
  binding.pry
  p