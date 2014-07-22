class MapController < ApplicationController
  def index
    @places = Place.all
    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.lat
      marker.lng place.lng
      marker.infowindow "<h1>#{place.name}</h1><p>#{place.description}</p>"
    end
    @place = Place.new
  end
end
