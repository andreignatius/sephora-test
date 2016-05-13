require 'test_helper'

class ProductsIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin     = users(:michael)
    @non_admin = users(:archer)
  end

  test "index including pagination" do
    log_in_as(@admin)
    get products_path
    assert_template 'products/index'
    assert_select 'div.pagination'
    Product.paginate(page: 1).each do |product|
      assert_select 'a[href=?]', product_path(product), text: product.name
    end
  end
  
  test "index as admin including pagination and delete links" do
    log_in_as(@admin)
    get products_path
    assert_template 'products/index'
    assert_select 'div.pagination'
    first_page_of_products = Product.paginate(page: 1)
    first_page_of_products.each do |product|
      assert_select 'a[href=?]', user_path(product), text: product.name
      unless user == @admin
        assert_select 'a[href=?]', user_path(product), text: 'delete'
      end
    end
    assert_difference 'Product.count', -1 do
      delete user_path(@non_admin)
    end
  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    get products_path
    assert_select 'a', text: 'delete', count: 0
  end
end
