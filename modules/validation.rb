# frozen_string_literal: true

# Validator module - add validations to models
module Validator
  def show_errors
    @errors.empty? || @errors.each { |value| p "Errors in #{self}: #{value}" }
  end

  private

  def validate_type(class_name, *attributes)
    attributes.each do |attr|
      if public_send(attr).class != class_name
        @errors ||= []
        @errors << "Type of #{attr} must be a #{class_name}"
      end
    end

    @errors&.any? ? false : true
  end

  def validate_presence(*attributes)
    attributes.each do |attr|
      if public_send(attr).nil?
        @errors ||= []
        @errors << "#{attr} must be present"
      end
    end

    @errors&.any? ? false : true
  end

  def validate_emptiness(*attributes)
    attributes.each do |attr|
      if public_send(attr) == ''
        @errors ||= []
        @errors << "#{attr} can't be blank"
      end
    end

    @errors&.any? ? false : true
  end

  def validate_positive(*attributes)
    attributes.each do |attr|
      if public_send(attr).to_i <= 0
        @errors ||= []
        @errors << "#{attr} must be positive"
      end
    end

    @errors&.any? ? false : true
  end
end
