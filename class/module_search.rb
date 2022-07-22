# frozen_string_literal: true

# module search
module Search
<<<<<<< HEAD
  def search_by_age(condition, value)
    case condition
    when 'age>='
      response = filter_by_age(condition, value)
    when 'age<='
      response = filter_by_age(condition, value)
=======
  def search_by_value(condition, value)
    case condition
    when 'value>='
      response = filter_by_value(condition, value)
    when 'value<='
      response = filter_by_value(condition, value)
>>>>>>> class_excersice_product
    end
    response
  end

<<<<<<< HEAD
  def filter_by_age(condition, value)
    responses = []
    @users.each do |user|
      responses << user if user[:age] >= value && condition.include?('>=')
      responses << user if user[:age] <= value && condition.include?('<=')
=======
  def filter_by_value(condition, value)
    responses = []
    @products.each do |product|
      responses << product if product[:value] >= value && condition.include?('>=')
      responses << product if product[:value] <= value && condition.include?('<=')
>>>>>>> class_excersice_product
    end
    return responses unless responses.eql?([])

    'not found'
  end

  def search(condition, value)
    responses = []
<<<<<<< HEAD
    @users.each do |user|
      responses << user if user[:"#{condition}"] == value
=======
    @products.each do |product|
      responses << product if product[:"#{condition}"] == value
>>>>>>> class_excersice_product
    end
    return responses unless responses.eql?([])

    'not found'
  end

  def search_by_id(id)
<<<<<<< HEAD
    @users.each do |user|
      return user if user[:id] == id
=======
    @products.each do |product|
      return product if product[:id] == id
>>>>>>> class_excersice_product
    end
    'not found'
  end
end
