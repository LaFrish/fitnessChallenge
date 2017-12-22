require 'test_helper'

class WatersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @water = waters(:one)
  end

  test "should get index" do
    get waters_url
    assert_response :success
  end

  test "should get new" do
    get new_water_url
    assert_response :success
  end

  test "should create water" do
    assert_difference('Water.count') do
      post waters_url, params: { water: {  } }
    end

    assert_redirected_to water_url(Water.last)
  end

  test "should show water" do
    get water_url(@water)
    assert_response :success
  end

  test "should get edit" do
    get edit_water_url(@water)
    assert_response :success
  end

  test "should update water" do
    patch water_url(@water), params: { water: {  } }
    assert_redirected_to water_url(@water)
  end

  test "should destroy water" do
    assert_difference('Water.count', -1) do
      delete water_url(@water)
    end

    assert_redirected_to waters_url
  end
end
