require 'test_helper'

class WombatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wombats_index_url
    assert_response :success
  end

end
