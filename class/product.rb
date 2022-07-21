# frozen_string_literal: true

require_relative 'module_validate'
require_relative 'module_search'

# class Product
class Product
  include Validate
  include Search
  @@products = []
  @@count = 0

  def initialize(product)
    @products = @@products
    @errors  = []

    @product = product
    @validate = validate?
  end

  def create
    @product[:id] = @@count unless @product.key?(:id).eql?(true)
    return @errors if @validate.eql?(false) && !@errors.empty?

    @@products << @product
    @@count += 1
    'new product create'
  end

  def where(condition, value)
    return search_by_value(condition, value) if condition.include?('value')

    search(condition, value)
  end

  def update(id, obj)
    product = remove(id)
    return product if product.eql?('not found')

    obj[:id] = id
    product_to_update = Product.new(obj).create
    return product_to_update if product_to_update.eql?('new product create')

    @@products << product unless product_to_update.eql?('new product create')
    product_to_update
  end

  def find(id)
    search_by_id(id)
  end

  def remove(id)
    obj = search_by_id(id)
    return 'not found' if obj.eql?('not found')

    @@products.delete(obj)
  end

  def all
    @@products
  end

  def counter
    @@count
  end
end
