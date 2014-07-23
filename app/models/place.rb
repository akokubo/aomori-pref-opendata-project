class Place < ActiveRecord::Base
  has_one :image, class_name: "PlaceImage", dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true
end
