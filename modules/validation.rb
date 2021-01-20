module Validator
  def validate_class(class_name, *attributes)
    errors = attributes.map do |attr|
      "Type of #{attr} must be an instance of #{class_name}" if public_send(attr).class != class_name
    end
    errors.compact
  end

  def validate_presence(*attributes)
    errors = attributes.map do |attr|
      "#{attr} must be present" if public_send(attr).nil?
    end
    errors.compact
  end

  def validate_emptiness(*attributes)
    errors = attributes.map do |attr|
      "#{attr} can't be blank" if public_send(attr) == ''
    end
    errors.compact
  end

  def validate_positive(*attributes)
    errors = attributes.map do |attr|
      "#{attr} must be positive" if public_send(attr).to_i <= 0
    end
    errors.compact
  end
end
