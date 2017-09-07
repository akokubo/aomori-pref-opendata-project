require 'test_helper'

class PlacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @place = places(:one)
  end

  test "should get index" do
    get places_url
    assert_response :success
  end

  test "should get new" do
    get new_place_path
    assert_response :success
  end

  test "should create place" do
    assert_difference('Place.count') do
      post places_path, params: { place: { description: @place.description, lat: @place.lat, lng: @place.lng, name: @place.name } }
    end

    assert_redirected_to map_path
  end

  test "should show place" do
    get place_path(@place)
    assert_response :success
  end

  test "should get edit" do
    get edit_place_path(@place)
    assert_response :success
  end

  test "should update place" do
    patch place_path(@place), params: { place: { description: @place.description, lat: @place.lat, lng: @place.lng, name: @place.name } }

    assert_redirected_to place_path(@place)
  end

  test "should destroy place" do
    assert_difference('Place.count', -1) do
      delete place_path(@place)
    end

    assert_redirected_to map_path
  end
end
