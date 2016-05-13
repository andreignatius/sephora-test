require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  def setup
    @user       = users(:michael)
    @other_user = users(:archer)
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Product.count' do
      delete :destroy, id: @product
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'Product.count' do
      delete :destroy, id: @product
    end
    assert_redirected_to root_url
  end
end
