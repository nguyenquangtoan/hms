require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get dash_board" do
    get :dash_board
    assert_response :success
  end

end
