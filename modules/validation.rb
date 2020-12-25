module Validator
  
    def validate_type(class_name, *attributes)
    @errors[:type] = []
    attributes.each do |attr|
      if self.send(attr).nil?
        next
      elsif self.send(attr).class == class_name
        true
      else
        @errors[:type] << "Type of #{attr} must be a #{class_name}"
      end
    end
  end

  def validate_presence(*attributes)
    @errors[:presence] = []
    attributes.each do |attr|
      unless self.send(attr).nil?
        true
      else
        @errors[:presence] << "#{attr} must be present"
      end
    end
  end 
  
  def validate_emptiness(*attributes)
    @errors[:emptiness] = []
    attributes.each do |attr|
      if self.send(attr).nil?
        next
      elsif self.send(attr).to_s == ""
        @errors[:emptiness] << "#{attr} can't be blank"
      else 
        true
      end
    end
  end  
  
  def validate_positive(*attributes)
    @errors[:positive] = []
    attributes.each do |attr|
      if self.send(attr).nil?
        next
      elsif self.send(attr).is_a?(Integer) && self.send(attr) <= 0  
        @errors[:positive] << "#{attr} must be positive"
      else
        true
      end
    end
  end
  
  def errors
    @errors.each do |_key, value|
      p "Errors in #{self}: #{value}" if value.any?
    end
  end
  
end