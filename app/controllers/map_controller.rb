class MapController < ApplicationController
  def index
    @places = Place.all
    @lat_max = Place.maximum(:lat)
    @lat_min = Place.minimum(:lat)
    @lng_max = Place.maximum(:lng)
    @lng_min = Place.minimum(:lng)
  end
end
