class Reader
  include Validator
  attr_reader :name, :email, :city, :street, :house
  
  def initialize(name: nil, email: nil, city: nil, street: nil, house: nil)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
    @errors = {}
    validate_presence :name, :email, :city, :street, :house
    validate_type String, :name, :email, :city, :street
    validate_type Integer, :house
    validate_emptiness :name, :email, :city, :street, :house
    validate_positive :house
    
  end
  
end


