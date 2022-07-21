# frozen_string_literal: true

# module validate
module Validate
  def validate?
    @errors << 'name is required' if @user[:name].nil?
    @errors << 'last name is required' if @user[:last_name].nil?
    @errors << 'email is required' if @user[:email].nil?

    # status = nil
    status = validate_email if @users.length >= 1
    # p status

    @errors << status unless status.eql?(nil)
    return false unless @errors.empty?

    true
  end

  def validate_email
    @users.each do |user|
      return 'email is repeat' if user[:email].eql?(@user[:email])

      next
    end
    nil
  end
end
