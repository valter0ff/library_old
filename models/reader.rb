class Reader
  include Validator

  attr_reader :name, :email, :city, :street, :house

  def initialize(name: nil, email: nil, city: nil, street: nil, house: nil)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  def validate!
    check_presence
    check_class
    check_emptiness
    check_positive
  end

  private

  def check_presence
    errors = validate_presence :name, :email, :city, :street, :house
    raise PresenceError, errors unless errors.empty?
  end

  def check_class
    errors = [validate_class(String, :name, :email, :city, :street),
              validate_class(Integer, :house)].flatten
    raise ClassError, errors unless errors.empty?
  end

  def check_emptiness
    errors = validate_emptiness :name, :email, :city, :street, :house
    raise EmptinessError, errors unless errors.empty?
  end

  def check_positive
    errors = validate_positive :house
    raise PositiveNumberError, errors unless errors.empty?
  end
end
