module Validator
  
  def validate_type(class_name, *attributes)
    attributes.each do |attr|
      if self.send(attr).class != class_name
        @errors << "Type of #{attr} must be a #{class_name}"
      end
    end
    
    @errors.any? ? false : true
  end

  def validate_presence(*attributes)
    attributes.each do |attr|
      @errors << "#{attr} must be present" if self.send(attr).nil?
    end
    
    @errors.any? ? false : true
  end 
  
  def validate_emptiness(*attributes)
    attributes.each do |attr|
      @errors << "#{attr} can't be blank" if self.send(attr) == ""
    end
    
    @errors.any? ? false : true
  end  
  
  def validate_positive(*attributes)
    attributes.each do |attr|
      if self.send(attr).is_a?(Integer) && self.send(attr) <= 0  
        @errors << "#{attr} must be positive"
      end
    end
    
    @errors.any? ? false : true
  end
  
  def errors
    unless @errors.empty?
      @errors.each { |value| p "Errors in #{self}: #{value}" }
    end
  end
  
end