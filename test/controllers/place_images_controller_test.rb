require 'test_helper'

class PlaceImagesControllerTest < ActionController::TestCase
=begin
  setup do
    @place_image = PlaceImage.first
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:place_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create place_image" do
    assert_difference('PlaceImage.count') do
      post :create, place_image: { content_type: @place_image.content_type, data: @place_image.data, place_id: @place_image.place_id }
    end

    assert_redirected_to place_image_path(assigns(:place_image))
  end

  test "should show place_image" do
    get :show, id: @place_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @place_image
    assert_response :success
  end

  test "should update place_image" do
    patch :update, id: @place_image, place_image: { content_type: @place_image.content_type, data: @place_image.data, place_id: @place_image.place_id }
    assert_redirected_to place_image_path(assigns(:place_image))
  end

  test "should destroy place_image" do
    assert_difference('PlaceImage.count', -1) do
      delete :destroy, id: @place_image
    end

    assert_redirected_to place_images_path
  end
=end
end
