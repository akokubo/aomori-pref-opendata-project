require 'test_helper'

class InitialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @initial = Initial.create(zoom: 10, lat: 45, lng: 140, title: "Lorem ipsum", description: "Lorem ipsum " * 20)
  end

  test "should show initial" do
    get initial_path
    assert_response :success
  end

  test "should get edit" do
    get edit_initial_path
    assert_response :success
  end

  test "should update initial" do
    patch initial_path, params: { initial: { description: @initial.description, lat: @initial.lat, lng: @initial.lng, title: @initial.title, zoom: @initial.zoom } }
    assert_redirected_to initial_path
  end

  test "should destroy initial" do
    assert_no_difference('Initial.count') do
      delete initial_path
    end
    assert_redirected_to initial_path
  end
end
