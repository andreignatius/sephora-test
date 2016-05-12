require 'test_helper'

class ProductsEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @product = products(:one)
  end
  
  test "unsuccessful edit" do
    get edit_product_path(@product)
    assert_template 'products/edit'
    patch product_path(@product), product: { name: "",
                                            description: "",
                                            price: -1 }
    assert_template 'products/edit'
  end
  
  test "successful edit" do
    get edit_product_path(@product)
    assert_template 'products/edit'
    name = "something1"
    description = "description1"
    price = 5.0
    patch product_path(@product), product: { name: name,
                                            description: description,
                                            price: price }
    assert_not flash.empty?
    assert_redirected_to @product
    @product.reload
    assert_equal name, @product.name
    assert_equal description, @product.description
    assert_equal price, @product.price
  end
end
