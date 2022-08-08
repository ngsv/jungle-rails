require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'saves a valid product' do
      @category = Category.new(:name => "Bushes")
      @product = Product.new(:name => "Pine", :price_cents => "999", :quantity => "5", :category => @category)
      expect(@product).to be_valid
    end

    it 'is invalid without a name' do
      @category = Category.new(:name => "Bushes")
      @product = Product.new(:name => nil, :price_cents => "999", :quantity => "5", :category => @category)
      expect(@product).to be_invalid
    end

    it 'is invalid without a price' do
      @category = Category.new(:name => "Bushes")
      @product = Product.new(:name => "Pine", :price_cents => nil, :quantity => "5", :category => @category)
      expect(@product).to be_invalid
    end

    it 'is invalid without a quantity' do
      @category = Category.new(:name => "Bushes")
      @product = Product.new(:name => "Pine", :price_cents => "999", :quantity => nil, :category => @category)
      expect(@product).to be_invalid
    end

    it 'is invalid without a category' do
      @category = Category.new(:name => "Bushes")
      @product = Product.new(:name => "Pine", :price_cents => "999", :quantity => "5", :category => nil)
      expect(@product).to be_invalid
    end

  end
end
