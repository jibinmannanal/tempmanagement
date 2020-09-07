require 'test_helper'

class SevaTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @seva_type = seva_types(:one)
  end

  test "should get index" do
    get seva_types_url
    assert_response :success
  end

  test "should get new" do
    get new_seva_type_url
    assert_response :success
  end

  test "should create seva_type" do
    assert_difference('SevaType.count') do
      post seva_types_url, params: { seva_type: { name: @seva_type.name } }
    end

    assert_redirected_to seva_type_url(SevaType.last)
  end

  test "should show seva_type" do
    get seva_type_url(@seva_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_seva_type_url(@seva_type)
    assert_response :success
  end

  test "should update seva_type" do
    patch seva_type_url(@seva_type), params: { seva_type: { name: @seva_type.name } }
    assert_redirected_to seva_type_url(@seva_type)
  end

  test "should destroy seva_type" do
    assert_difference('SevaType.count', -1) do
      delete seva_type_url(@seva_type)
    end

    assert_redirected_to seva_types_url
  end
end
