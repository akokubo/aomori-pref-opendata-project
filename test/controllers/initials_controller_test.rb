require 'test_helper'

class InitialsControllerTest < ActionController::TestCase
  setup do
    @initial = initials(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create initial" do
    post :create, initial: { description: @initial.description, lat: @initial.lat, lng: @initial.lng, title: @initial.title, zoom: @initial.zoom }
    assert_redirected_to initial_path
  end

  test "should show initial" do
    get :show, id: @initial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @initial
    assert_response :success
  end

  test "should update initial" do
    patch :update, id: @initial, initial: { description: @initial.description, lat: @initial.lat, lng: @initial.lng, title: @initial.title, zoom: @initial.zoom }
    assert_redirected_to initial_path
  end

  test "should destroy initial" do
    delete :destroy, id: @initial

    assert_redirected_to initial_path
  end
end
