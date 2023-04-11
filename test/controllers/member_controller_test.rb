require "test_helper"

class MemberControllerTest < ActionDispatch::IntegrationTest
  test "should get ::reservation" do
    get member_::reservation_url
    assert_response :success
  end
end
