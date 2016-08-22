require 'test_helper'

class Admin::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_products_url
    
    assert_redirected_to new_user_session_url
  end

end
