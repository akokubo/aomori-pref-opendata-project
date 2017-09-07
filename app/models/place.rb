class Place < ApplicationRecord
  mount_uploader :image, ImageUploader
  validate :image_size
  validates :lat, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :lng, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :name, presence: true, length: { maximum: 255 }

  private

  def image_size
    if image.size > 5.megabytes
      errors.add(:image, 'shoud be less than 5MB')
    end
  end
end
