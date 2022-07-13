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
    flag = nil
    return 'id is required' if @product['id'].nil? || @product['id'].eql?('')
    return 'name is required' if @product['name'].nil? || @product['name'].eql?('')
    return 'value is required' if @product['value'].nil? || @product['value'].eql?('')
    return 'brand is required' if @product['brand'].nil? || @product['brand'].eql?('')

    if @@products.length >= 1
      @@products.each do |product_obj|
        flag = product_obj['id'].eql? @product['id']
        return 'the id cannot be repeated' if flag.eql? true

        break if flag.eql?(true)
      end
      if flag.eql?(false)
        @@count += 1
        @@products << @product
        @product
      end
    else
      @@count += 1
      @@products << @product
      @product
    end
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
    responses = []

    @@products.each do |product|
      if type.include?('value')
        next if product['value'].nil?
        responses << product if product['value'] <= data && type.include?('<=')
        responses << product if product['value'] >= data && type.include?('>=')
      else
        next if product[type].nil?
        responses << product if product[type] == data
      end
    end
    if responses.nil?.eql?(false) && responses.eql?([]) == false
      responses
    else
      'not found'
    end
  end

  def update(id, object)
    return 'id is required' if object['id'].nil?.eql?(true) || object['id'].eql?('')
    return 'name is required' if object['name'].nil?.eql?(true) || object['name'].eql?('')
    return 'value is required' if object['value'].nil?.eql?(true) || object['value'].eql?('')
    return 'brand is required' if object['brand'].nil?.eql?(true) || object['brand'].eql?('')

    product_found = {}
    @@products.each do |product|
      product_found = product if product['id'] == id
    end

    return 'id not found' if product_found.nil?.eql?(true) || product_found.eql?({})

    @@products.delete(product_found)

    @@products.each do |product|
      if product['id'].eql?(object['id'])
        @@products << product_found
        return 'that id is registered'
      end
    end
    @@products << object
    object
  end

  def delete(id)
    product_found = {}
    @@products.each do |product|
      product_found = product if product['id'] == id
    end

    return 'id not found' if product_found.nil?.eql?(true) || product_found.eql?({})

    @@products.delete(product_found)
    product_found
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
