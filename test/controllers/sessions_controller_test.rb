require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get parent" do
    get :parent
    assert_response :success
  end

end
