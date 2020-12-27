# frozen_string_literal: true

# Validator module - add validations to models
module Validator
  def errors
    @errors.empty? || @errors.each { |value| p "Errors in #{self}: #{value}" }
  end

  private

  def validate_type(class_name, *attributes)
    attributes.each do |attr|
      if self.public_send(attr).class != class_name
        @errors << "Type of #{attr} must be a #{class_name}"
      end
    end

    @errors.any? ? false : true
  end

  def validate_presence(*attributes)
    attributes.each do |attr|
      @errors << "#{attr} must be present" if self.public_send(attr).nil?
    end

    @errors.any? ? false : true
  end

  def validate_emptiness(*attributes)
    attributes.each do |attr|
      @errors << "#{attr} can't be blank" if self.public_send(attr) == ''
    end

    @errors.any? ? false : true
  end

  def validate_positive(*attributes)
    attributes.each do |attr|
      @errors << "#{attr} must be positive" if self.public_send(attr).to_i <= 0
    end

    @errors.any? ? false : true
  end
end
