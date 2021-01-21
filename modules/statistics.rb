module Statistics
  def top_readers(orders, quantity = 1)
    top_objects(orders, :reader, quantity).keys.map(&:name)
  end

  def top_books(orders, quantity = 1)
    top_objects(orders, :book, quantity).keys.map(&:title)
  end

  def number_readers_of_top_books(orders, quantity = 1)
    top_objects(orders, :book, quantity).values.flatten.map(&:reader).uniq.size
  end

  def top_objects(orders, object, quantity)
    orders.group_by(&object).max_by(quantity) { |_key, value| value.size }.to_h
  end
end
