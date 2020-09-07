require 'test_helper'

class GotrasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gotra = gotras(:one)
  end

  test "should get index" do
    get gotras_url
    assert_response :success
  end

  test "should get new" do
    get new_gotra_url
    assert_response :success
  end

  test "should create gotra" do
    assert_difference('Gotra.count') do
      post gotras_url, params: { gotra: { name: @gotra.name } }
    end

    assert_redirected_to gotra_url(Gotra.last)
  end

  test "should show gotra" do
    get gotra_url(@gotra)
    assert_response :success
  end

  test "should get edit" do
    get edit_gotra_url(@gotra)
    assert_response :success
  end

  test "should update gotra" do
    patch gotra_url(@gotra), params: { gotra: { name: @gotra.name } }
    assert_redirected_to gotra_url(@gotra)
  end

  test "should destroy gotra" do
    assert_difference('Gotra.count', -1) do
      delete gotra_url(@gotra)
    end

    assert_redirected_to gotras_url
  end
end
