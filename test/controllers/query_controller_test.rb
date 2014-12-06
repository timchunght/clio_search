require 'test_helper'

class QueryControllerTest < ActionController::TestCase
  test "should get search_result" do
    get :search_result
    assert_response :success
  end

end
