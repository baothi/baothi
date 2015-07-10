require 'test_helper'

class BookingControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get yourbooking" do
    get :yourbooking
    assert_response :success
  end

end
