require 'test_helper'

class Admin::CatalogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_catalogs_index_url
    assert_response :success
  end

end
