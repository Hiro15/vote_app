require 'test_helper'

class BoardsControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get boards_view_url
    assert_response :success
  end

end
