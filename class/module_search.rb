# frozen_string_literal: true

# module search
module Search
  def search_by_value(condition, value)
    case condition
    when 'value>='
      response = filter_by_value(condition, value)
    when 'value<='
      response = filter_by_value(condition, value)
    end
    response
  end

  def filter_by_value(condition, value)
    responses = []
    @products.each do |product|
      responses << product if product[:value] >= value && condition.include?('>=')
      responses << product if product[:value] <= value && condition.include?('<=')
    end
    return responses unless responses.eql?([])

    'not found'
  end

  def search(condition, value)
    responses = []
    @products.each do |product|
      responses << product if product[:"#{condition}"] == value
    end
    return responses unless responses.eql?([])

    'not found'
  end

  def search_by_id(id)
    @products.each do |product|
      return product if product[:id] == id
    end
    'not found'
  end
end
