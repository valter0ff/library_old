# frozen_string_literal: true

# module Statistics do some work
module Statistics
  def top_readers(quantity = 1)
    top_objects(:reader, quantity).keys.map { |reader| reader.name}
  end

  def top_books(quantity = 1)
    top_objects(:book, quantity).keys.map { |book| book.title}
  end

  def number_readers_of_top_books(quantity = 1)
    top_objects(:book, quantity).values.flatten.map {|order| order.reader}.uniq.size
  end

  def top_objects(object, quantity)
    orders.group_by(&object).max_by(quantity) { |_key,value| value.size }.to_h
  end
end
