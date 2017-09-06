require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  def setup
    @place = Place.new(lat: 45, lng: 140, name: "Lorem ipsum", description: "Lorem ipsum " * 20)
  end

  test "should be valid" do
    assert @place.valid?    
  end

  test "lat should be present" do
    @place.lat = nil
    assert_not @place.valid?
  end

  test "lat should be larger than or equal to -90" do
    @place.lat = -91
    assert_not @place.valid?
  end

  test "lat should be small than or equal to 90" do
    @place.lat = 91
    assert_not @place.valid?
  end

  test "lng should be present" do
    @place.lng = nil
    assert_not @place.valid?
  end

  test "lng should be larger than or equal to -180" do
    @place.lat = -181
    assert_not @place.valid?
  end

  test "lng should be small than or equal to 180" do
    @place.lat = 181
    assert_not @place.valid?
  end

  test "name should be present" do
    @place.name = "     "
    assert_not @place.valid?
  end

  test "name should not be too long" do
    @place.name = "a" * 256
    assert_not @place.valid?
  end
end
