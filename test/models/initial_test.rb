require 'test_helper'

class InitialTest < ActiveSupport::TestCase
  def setup
    @initial = Initial.new(zoom: 10, lat: 45, lng: 140, title: "Lorem ipsum", description: "Lorem ipsum " * 20)
  end

  test "should be valid" do
    assert @initial.valid?    
  end

  test "zoom should be present" do
    @initial.zoom = nil
    assert_not @initial.valid?
  end

  test "zoom should be larger than or equal to 0" do
    @initial.zoom = -1
    assert_not @initial.valid?
  end

  test "zoom should be small than or equal to 21" do
    @initial.zoom = 22
    assert_not @initial.valid?
  end

  test "lat should be present" do
    @initial.lat = nil
    assert_not @initial.valid?
  end

  test "lat should be larger than or equal to -90" do
    @initial.lat = -91
    assert_not @initial.valid?
  end

  test "lat should be small than or equal to 90" do
    @initial.lat = 91
    assert_not @initial.valid?
  end

  test "lng should be present" do
    @initial.lng = nil
    assert_not @initial.valid?
  end

  test "lng should be larger than or equal to -180" do
    @initial.lat = -181
    assert_not @initial.valid?
  end

  test "lng should be small than or equal to 180" do
    @initial.lat = 181
    assert_not @initial.valid?
  end

  test "title should be present" do
    @initial.title = "     "
    assert_not @initial.valid?
  end

  test "title should not be too long" do
    @initial.title = "a" * 256
    assert_not @initial.valid?
  end
end
