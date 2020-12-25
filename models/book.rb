class Book
  include Validator
  attr_reader :title, :author
  
  def initialize(title: nil, author: nil)
    @title = title
    @author = author
    @errors = {}
    
    validate_presence :title, :author
    validate_type String, :title
    validate_type Author, :author
    validate_emptiness :title     
  end
  
end
