# frozen_string_literal: true

require_relative 'module_validate'
require_relative 'module_search'

# class user
class User
  include Validate
  include Search
  @@users = []
  @@count = 0

  def initialize(user)
    @users = @@users
    @errors  = []

    @user = user
    @validate = validate?
  end

  def create
    @user[:id] = @@count unless @user.key?(:id).eql?(true)
    return @errors if @validate.eql?(false) && !@errors.empty?

    @@users << @user
    @@count += 1
    'new user create'
  end

  def where(condition, value)
    return search_by_age(condition, value) if condition.include?('age')

    search(condition, value)
  end

  def update(id, obj)
    user = delete(id)

    return user if user.eql?('not found')

    obj[:id] = id
    user_to_update = User.new(obj).create

    return obj if user_to_update.eql?('new user create')

    @@users << user
    user_to_update
  end

  def find(id)
    search_by_id(id)
  end

  def delete(id)
    obj = search_by_id(id)
    return 'not found' if obj.eql?('not found')

    @@users.delete(obj)
    obj
  end

  def all
    @@users
  end

  def counter
    @@count
  end
end

# user1 = User.new(
#   {
#     name: 'jose', last_name: 'fernandez', email: 'josefernandezllanos@gmail.com',
#     age: 18, address: 'cll15#22760'
#   }
# )
# user1.create
# user2 = User.new(
#   {
#     name: 'ismael', last_name: 'fernandez', email: 'josefernandezllanos@gmail.com',
#     age: 18, address: 'cll15#22760'
#   }
# )
# user3 = {
#   name: 'jose', last_name: 'fernandez', email: 'isma@gmail.com',
#   age: 18, address: 'cll15#22760'
# }
# puts user2.create

# # puts user1.find(1)
# # puts user1.delete(1)
# puts user1.find(0)
# puts user1.find(1)
# puts user1.update(1, user3)
# puts user1.find(1)
# puts user1.all.to_s
