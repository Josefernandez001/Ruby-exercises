# frozen_string_literal: true

# module validate
module Validate
  def validate?
    @errors << 'name is required' if @product[:name].nil?
    @errors << 'value is required' if @product[:value].nil?
    @errors << 'brand is required' if @product[:brand].nil?

    return false unless @errors.empty?

    true
  end
end
