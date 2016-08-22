require 'test_helper'

class Admin::CatalogControllerTest < ActionDispatch::IntegrationTest

  test "should properly handle catalog new" do
    get new_admin_catalog_url

    assert_redirected_to new_user_session_url
  end

end
