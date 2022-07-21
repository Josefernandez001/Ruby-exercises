# frozen_string_literal: true

# module search
module Search
  def search_by_age(condition, value)
    case condition
    when 'age>='
      response = filter_by_age(condition, value)
    when 'age<='
      response = filter_by_age(condition, value)
    end
    response
  end

  def filter_by_age(condition, value)
    responses = []
    @users.each do |user|
      responses << user if user[:age] >= value && condition.include?('>=')
      responses << user if user[:age] <= value && condition.include?('<=')
    end
    return responses unless responses.eql?([])

    'not found'
  end

  def search(condition, value)
    responses = []
    @users.each do |user|
      responses << user if user[:"#{condition}"] == value
    end
    return responses unless responses.eql?([])

    'not found'
  end

  def search_by_id(id)
    @users.each do |user|
      return user if user[:id] == id
    end
    'not found'
  end
end
