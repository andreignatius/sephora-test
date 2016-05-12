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
end
