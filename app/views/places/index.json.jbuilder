json.array!(@places) do |place|
  json.extract! place, :id, :name, :category_id, :lat, :lng, :description
  json.url place_url(place, format: :json)
end
