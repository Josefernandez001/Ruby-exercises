# frozen_string_literal: true

# module validate
module Validate
  def validate?
<<<<<<< HEAD
    @errors << 'name is required' if @user[:name].nil?
    @errors << 'last name is required' if @user[:last_name].nil?
    @errors << 'email is required' if @user[:email].nil?

    # status = nil
    status = validate_email if @users.length >= 1
    # p status

    @errors << status unless status.eql?(nil)
=======
    @errors << 'name is required' if @product[:name].nil?
    @errors << 'value is required' if @product[:value].nil?
    @errors << 'brand is required' if @product[:brand].nil?

>>>>>>> class_excersice_product
    return false unless @errors.empty?

    true
  end
<<<<<<< HEAD

  def validate_email
    @users.each do |user|
      return 'email is repeat' if user[:email].eql?(@user[:email])

      next
    end
    nil
  end
=======
>>>>>>> class_excersice_product
end
