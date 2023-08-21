require "test_helper"

class MembershipTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get membership_types_index_url
    assert_response :success
  end

  test "should get new" do
    get membership_types_new_url
    assert_response :success
  end
end
