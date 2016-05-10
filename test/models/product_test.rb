require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @product = Product.new(name: "Example Product", description: "something",
                          price: 2.5, quantity_total: 10)
  end
  
  test "should be valid" do
    assert @product.valid?
  end
  
  test "name should be present" do
    @product.name = "    "
    assert_not @product.valid?
  end
  
  test "name should not be too long" do
    @product.name = "a" * 51
    assert_not @product.valid?
  end
  
  test "price should be positive" do
    @product.price = -1
    assert_not @product.valid?
  end
end
