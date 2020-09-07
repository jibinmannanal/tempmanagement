require 'test_helper'

class SevaBookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get booking" do
    get seva_bookings_booking_url
    assert_response :success
  end

end
