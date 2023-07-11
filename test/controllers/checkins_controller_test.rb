require "test_helper"

class CheckinsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get checkins_new_url
    assert_response :success
  end
end
