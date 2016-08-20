require 'test_helper'

class Admin::CatalogControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_catalog_index_url
    assert_response :success
  end

end
