# frozen_string_literal: true

# class user
class User
  @@users = []
  @@count = 0
  def initialize(user)
    @user = user
  end

  def create
    @user['id'] = @@count
    message = validating_required_fields
    return message unless message.include?('all')

    return email_is_repeated if @@users.length >= 1

    saving_an_object
  end

  def find(id)
    @@users.each do |user|
      return user if user['id'] == id
    end
    'id not found'
  end

  def where(type, data)
    @responses = []
    return find_by_age(data, type) if type.include?('age')

    find_by_type(type, data)

    return @responses if !@responses.nil? && @responses != []

    'not found'
  end

  def update(id, object)
    @user = object
    message = validating_required_fields

    return message unless message.include?('all')

    user_found = find(id)

    return user_found if user_found.eql?('id not found')

    # puts "this is use found #{user_found}"
    @@users.delete(user_found)
    # puts "all user now #{@@users}"
    status = email_repeated_update?(user_found, object)
    # puts value
    return status if status.eql?('that email is registered')

    updating_an_object(object, id)
  end

  def delete(id)
    user_found = find(id)

    return user_found if user_found.eql?('id not found')

    @@users.delete(user_found)
    user_found
  end

  def counter
    @@count
  end

  def all
    @@users
  end
end

# user class , but in this class there are some helper methods
class User
  def validating_required_fields
    return 'name is required' if @user['name'].nil? || @user['name'].eql?('')
    return 'last name is required' if @user['last_name'].nil? || @user['last_name'].eql?('')
    return 'email is required' if @user['email'].nil? || @user['email'].eql?('')

    'all'
  end

  def email_is_repeated
    message = nil
    @@users.each do |user|
      message = checking_email(user)
      break if message.eql?('the email cannot be repeated')
    end
    return message unless message.eql?('correct')

    saving_an_object
  end

  def email_repeated_update?(user_found, object)
    @@users.each do |user|
      if user['email'].eql?(object['email'])
        @@users << user_found
        return 'that email is registered'
      end
    end
    'correct'
  end

  def checking_email(user_obj)
    flag2 = user_obj['email'].eql? @user['email']
    return 'the email cannot be repeated' if flag2.eql? true

    'correct'
  end

  def filtering_by_age_type?(data, type)
    # @responses = []
    @@users.each do |user|
      next if user['age'].nil?

      @responses << user if user['age'] <= data && type.include?('<=')
      @responses << user if user['age'] >= data && type.include?('>=')
    end
    @responses
  end

  def find_by_age(data, type)
    filtering_by_age_type?(data, type)
    return @responses if !@responses.nil? && @responses != []

    'not found'
  end

  def find_by_type(type, data)
    @@users.each do |user|
      next if user[type].nil?

      @responses << user if user[type] == data
    end
    # puts @responses
    @responses
  end

  def updating_an_object(object, id)
    object['id'] = id
    @@users << object
    object
  end

  def saving_an_object
    @@count += 1
    @@users << @user
    'new user create'
  end
end

# user1 = User.new(
#   {
#     'name' => 'jose', 'last_name' => 'fernandez', 'email' => 'josefernandezllanos@gmail.com',
#     'age' => 18, 'address' => 'cll15#22760'
#   }
# )
# user2 = User.new(
#   {
#     'name' => 'jose2', 'last_name' => 'fernandez', 'email' => 'josefernandezllanos@gmail.com',
#     'age' => 17, 'address' => 'cll15#22760'
#   }
# )
# user3 = User.new(
#   {
#     'name' => 'paco', 'last_name' => 'fernandez', 'email' => 'jlla@gmail.com',
#     'age' => 12, 'address' => 'cll15#22760'
#   }
# )
# puts user1.create
# puts user2.create
# puts user3.create

# usuario = {
#   'name' => 'paco', 'last_name' => 'llanos', 'email' => 'paoc@gmail.com',
#   'age' => 33, 'address' => 'cll15#22760'
# }

# user1.update(0, usuario)
# puts user1.find(0)
# puts user1.where('name','paco')
# puts user1.delete(0)
# puts user1.delete(1)
# puts user1.delete(2)
# p user1.all

# puts user1.where('name','jose2')
# puts user1.where('name','jose2')
# puts user1.where('address', 'cll15#22760')
# puts user1.where('age<=', 12)
