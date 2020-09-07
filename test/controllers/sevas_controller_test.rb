require 'test_helper'

class SevasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @seva = sevas(:one)
  end

  test "should get index" do
    get sevas_url
    assert_response :success
  end

  test "should get new" do
    get new_seva_url
    assert_response :success
  end

  test "should create seva" do
    assert_difference('Seva.count') do
      post sevas_url, params: { seva: { audit_logs: @seva.audit_logs, identification_number: @seva.identification_number, instructions: @seva.instructions, name: @seva.name, rate: @seva.rate, status: @seva.status } }
    end

    assert_redirected_to seva_url(Seva.last)
  end

  test "should show seva" do
    get seva_url(@seva)
    assert_response :success
  end

  test "should get edit" do
    get edit_seva_url(@seva)
    assert_response :success
  end

  test "should update seva" do
    patch seva_url(@seva), params: { seva: { audit_logs: @seva.audit_logs, identification_number: @seva.identification_number, instructions: @seva.instructions, name: @seva.name, rate: @seva.rate, status: @seva.status } }
    assert_redirected_to seva_url(@seva)
  end

  test "should destroy seva" do
    assert_difference('Seva.count', -1) do
      delete seva_url(@seva)
    end

    assert_redirected_to sevas_url
  end
end
