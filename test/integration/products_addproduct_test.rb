require 'test_helper'

class ProductsAddproductTest < ActionDispatch::IntegrationTest
  
  test "invalid add product information" do
    get addproduct_path
    assert_no_difference 'Product.count' do
      post products_path, product: { name: "",
                                    description: "",
                                    price: -1 }
    end
    assert_template 'products/new'
  end
end
