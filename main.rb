require_relative 'autoload'


  reader1 = Reader.new(name: "vasya", email: "@sabaka", street: "", house: -10)
  reader1.errors
  
  author1 = Author.new(name: "Boris Akunin")
  author2 = Author.new(name: "")
  
  book1 = Book.new(title: "BEloe solnce", author: author1)
  book2 = Book.new(title: "Rikitikitavi", author: "Djek Vorobey")
  
  author2.errors
  p author1.name
  p book1.title
  p book1.author
  book2.errors