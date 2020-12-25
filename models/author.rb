class Author
  include Validator
  attr_reader :name, :biography
  
  def initialize(name: nil, biography: {})
    @name = name
    @biography = biography
    @errors = {}
    
    validate_presence :name
    validate_type String,:name
    validate_emptiness :name
  end
  
end