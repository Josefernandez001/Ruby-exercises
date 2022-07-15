# frozen_string_literal: true

# class product
class Product
  @@products = []
  @@count = 0
  def initialize(product)
    @product = product
  end

  def count
    @@count
  end

  def create
    @product['id'] = @@count
    message = validating_required_fields
    return message unless message.include?('all')

    saving_an_object
  end

  def all
    @@products
  end

  def find(id)
    @@products.each do |product|
      return product if product['id'] == id
    end
    'id not found'
  end

  def where(type, data)
    @responses = []

    return find_by_value(data, type) if type.include?('value')

    find_by_type(type, data)
    return @responses if !@responses.nil? && @responses != []

    'not found'
  end

  def update(id, object)
    @product = object
    message = validating_required_fields

    return message unless message.include?('all')

    prodcut_found = find(id)

    return prodcut_found if prodcut_found.eql?('id not found')

    @@products.delete(prodcut_found)

    updating_an_object(object, id)
  end

  def delete(id)
    product_found = find(id)

    return product_found if product_found.eql?('id not found')

    @@products.delete(product_found)
    product_found
  end
end

class Product
  def validating_required_fields
    return 'name is required' if @product['name'].nil? || @product['name'].eql?('')
    return 'value is required' if @product['value'].nil? || @product['value'].eql?('')
    return 'brand is required' if @product['brand'].nil? || @product['brand'].eql?('')

    'all'
  end

  def saving_an_object
    @@count += 1
    @@products << @product
    @product
  end

  def updating_an_object(object, id)
    object['id'] = id
    @@products << object
    object
  end

  def find_by_value(data, type)
    filtering_by_value_type?(data, type)
    return @responses if !@responses.nil? && @responses != []

    'not found'
  end

  def find_by_type(type, data)
    @@products.each do |product|
      next if product[type].nil?

      @responses << product if product[type] == data
    end
    # puts @responses
    @responses
  end

  def filtering_by_value_type?(data, type)
    # @responses = []
    @@products.each do |product|
      next if product['value'].nil?

      @responses << product if product['value'] <= data && type.include?('<=')
      @responses << product if product['value'] >= data && type.include?('>=')
    end
    @responses
  end
end
# {'id' => 0,'name' => '', 'value' => 0, 'brand' => '', 'description' => '', 'quantity' => 0}
# product = Product.new({'id' => 0,'name' => 'celphone', 'value' => 23239, 'brand' => 'motorola',
# 'description' => 'iphone14', 'quantity' => 16})
# product.create
# product1 = Product.new({'id' => 2,'name' => 'celphone', 'value' => 23239, 'brand' => 'apple',
# 'description' => 'iphone14', 'quantity' => 16})
# product1.create
# product.update(0,{'id' => 1,'name' => 'iphone', 'value' => 6_000_000, 'brand' => 'apple',
# 'description' => 'iphone14', 'quantity' => 100})

# puts product.count
