# frozen_string_literal: true

# class user
class User
  @@users = []
  @@count = 0
  def initialize(user)
    @user = user
  end

  def counter
    @@count
  end

  def create
    flag = nil
    flag2 = nil
    return 'id is required' if @user['id'].nil? || @user['id'].eql?('')
    return 'name is required' if @user['name'].nil? || @user['name'].eql?('')
    return 'last name is required' if @user['last_name'].nil? || @user['last_name'].eql?('')
    return 'email is required' if @user['email'].nil? || @user['email'].eql?('')

    if @@users.length >= 1
      @@users.each do |user_obj|
        flag = user_obj['id'].eql? @user['id']
        return 'the id cannot be repeated' if flag.eql? true

        flag2 = user_obj['email'].eql? @user['email']
        return 'the email cannot be repeated' if flag2.eql? true

        break if flag.eql?(true) || flag2.eql?(true)
      end
      if flag.eql?(false) && flag2.eql?(false)
        @@count += 1
        @@users << @user
        'new user create'
      end
    else
      @@count += 1
      @@users << @user
      'new user create'
    end
  end

  def all
    @@users
  end

  def find(id)
    @@users.each do |user|
      return user if user['id'] == id
    end
    'id not found'
  end

  def where(type, data)
    responses = []
    responses = case type
                when 'name'
                  @@users.each do |user|
                    next if user['name'].nil?

                    responses << user if user['name'] == data
                  end
                  responses
                when 'last_name'
                  @@users.each do |user|
                    next if user['last_name'].nil?

                    responses << user if user['last_name'] == data
                  end
                  responses
                when 'age>='
                  @@users.each do |user|
                    next if user['age'].nil?

                    responses << user if user['age'] >= data
                  end
                  responses
                when 'age<='
                  @@users.each do |user|
                    next if user['age'].nil?

                    responses << user if user['age'] <= data
                  end
                  responses
                when 'address'
                  @@users.each do |user|
                    next if user['address'].nil?

                    responses << user if user['address'] == data
                  end
                  responses
                else
                  'op not found'
                end
    if responses.nil?.eql?(false) && responses.eql?([]) == false
      responses
    else
      'not found'
    end
  end

  def update(id, object)
    return 'id is required' if object['id'].nil?.eql?(true) || object['id'].eql?('')
    return 'first name is required' if object['name'].nil?.eql?(true) || object['name'].eql?('')
    return 'last name is required' if object['last_name'].nil?.eql?(true) || object['last_name'].eql?('')
    return 'email is required' if object['email'].nil?.eql?(true) || object['email'].eql?('')

    user_found = {}
    @@users.each do |user|
      user_found = user if user['id'] == id
    end

    return 'id not found' if user_found.nil?.eql?(true) || user_found.eql?({})

    @@users.delete(user_found)

    @@users.each do |user|
      if user['id'].eql?(object['id'])
        @@users << user_found
        return 'that id is registered'
      end
      if user['email'].eql?(object['email'])
        @@users << user_found
        return 'that email is registered'
      end
    end
    @@users << object
    object
  end

  def delete(id)
    user_found = {}
    @@users.each do |user|
      user_found = user if user['id'] == id
    end

    return 'id not found' if user_found.nil?.eql?(true) || user_found.eql?({})

    @@users.delete(user_found)
    user_found
  end
end

# user2 = User.new({ 'id' => 2, 'name' => 'jose', 'last_name' => 'fernandez', 'email' => 'joase@',
# 'address' => 'aaaaa', 'age' => 18})
# user2.create
# user1 = User.new({ 'id' => 1, 'name' => 'jose', 'last_name' => 'fernandez', 'email' => 'jose@',
# 'address' => 'aaaaa', 'age' => 16 })
# user1.create
# # user3 = User.new({ 'id' => 3, 'name' => 'jose', 'last_name' => 'fernandez', 'email' => 'jose',
# 'address' => 'aaaaa', 'age' => 15 })
# user3.create

# puts user3.where('name', 'jose').to_s
# puts user3.where('last_name', 'fernandez').to_s
# puts user3.where('age>=', 18).to_s
# puts user3.where('age<=', 23).to_s
# puts user3.where('address', 'aaaaa').to_s

# puts user2.update(2,{'id' => 2, 'name' => 'ismael', 'last_name' => 'llanos', 'email' => 'jose@',
# 'address' => 'll23', 'age' => 18})
# puts user2.all
