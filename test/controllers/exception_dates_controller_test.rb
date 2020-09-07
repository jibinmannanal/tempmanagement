require 'test_helper'

class ExceptionDatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exception_date = exception_dates(:one)
  end

  test "should get index" do
    get exception_dates_url
    assert_response :success
  end

  test "should get new" do
    get new_exception_date_url
    assert_response :success
  end

  test "should create exception_date" do
    assert_difference('ExceptionDate.count') do
      post exception_dates_url, params: { exception_date: { dates: @exception_date.dates, name: @exception_date.name } }
    end

    assert_redirected_to exception_date_url(ExceptionDate.last)
  end

  test "should show exception_date" do
    get exception_date_url(@exception_date)
    assert_response :success
  end

  test "should get edit" do
    get edit_exception_date_url(@exception_date)
    assert_response :success
  end

  test "should update exception_date" do
    patch exception_date_url(@exception_date), params: { exception_date: { dates: @exception_date.dates, name: @exception_date.name } }
    assert_redirected_to exception_date_url(@exception_date)
  end

  test "should destroy exception_date" do
    assert_difference('ExceptionDate.count', -1) do
      delete exception_date_url(@exception_date)
    end

    assert_redirected_to exception_dates_url
  end
end
