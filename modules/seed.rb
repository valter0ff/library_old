# frozen_string_literal: true

require 'faker'

# module Seed generate fake data
module Seed
  def generate_data
    seed_authors
    seed_books
    seed_readers
    seed_orders
  end

  def seed_authors
    10.times do
      add(Author.new(name: Faker::Book.unique.author,
                     biography: Faker::Lorem.sentence(word_count: 10)))
    end
  end

  def seed_books
    50.times do
      add(Book.new(title: Faker::Book.unique.title,
                   author: authors.sample))
    end
  end

  def seed_readers
    20.times do
      add(Reader.new(name: Faker::Name.unique.name,
                     email: Faker::Internet.unique.email,
                     city: Faker::Address.city,
                     street: Faker::Address.street_name,
                     house: Faker::Address.building_number.to_i))
    end
  end

  def seed_orders
    100.times do
      add(Order.new(book: books.sample,
                    reader: readers.sample,
                    date: Date.today - rand(0..30)))
    end
  end
end
