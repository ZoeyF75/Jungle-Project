require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it('should save the name, price, quantity and category of product') do
      @category = Category.create(:name => 'beans')
      product = Product.new( 
        :name => 'brownbean', 
        :price => 3.50, 
        :quantity => 50, 
        :category_id => @category.id)
    expect(product).to be_valid
    end
    it('should not be valid product w/o name') do
      @category = Category.create(:name => 'beans')
      product = Product.new( 
        :name => nil, 
        :price => 3.50, 
        :quantity => 50, 
        :category_id => @category.id)
    expect(product).to_not be_valid
    end
    it('should not be valid product w/o price') do
      @category = Category.create(:name => 'beans')
      product = Product.new( 
        :name => 'brownbean', 
        :price => nil, 
        :quantity => 50, 
        :category_id => @category.id)
    expect(product).to_not be_valid
    end
    it('should not be valid product w/o quantity') do
      @category = Category.create(:name => 'beans')
      product = Product.new( 
        :name => 'brownbean', 
        :price => 3.50, 
        :quantity => nil, 
        :category_id => @category.id)
    expect(product).to_not be_valid
    end
    it('should not be valid product w/o category') do
      @category = Category.create(:name => 'beans')
      product = Product.new( 
        :name => 'brownbean', 
        :price => 3.50, 
        :quantity => 50, 
        :category_id => nil)
    expect(product).to_not be_valid
    end

  end
end
