require_relative 'autoload'

reader1 = Reader.new(name: 22, email: '@sabaka', street: '', house: -10)
reader2 = Reader.new(name: 'Mark', email: 'markus@gmail.com', city: 'London', street: 'Bayker', house: 21)
author1 = Author.new(name: 'Boris Akunin')
author2 = Author.new(name: '', biography: 'some bio')
book1 = Book.new(title: 'BEloe solnce', author: author1)
book2 = Book.new(title: '', author: 'Djek Vorobey')
order1 = Order.new(book: book2, reader: reader1)
order2 = Order.new(book: book1, reader: reader2)

lib = Library.new
lib.add(reader2)
lib.add(author1)
lib.add(book1)
lib.add(order2)

begin
  lib.add(author2)
rescue EmptinessError => e
  puts e.message
end

begin
  lib.add(reader1)
rescue PresenceError => e
  puts e.message
end

begin
  lib.add(book2)
rescue ClassError => e
  puts e.message
end

begin
  lib.add(order1)
rescue ClassError => e
  puts e.message
end

lib.generate_data
lib.store_to_file

puts lib.top_readers(lib.orders)
puts lib.top_books(lib.orders)
puts lib.number_readers_of_top_books(lib.orders)
