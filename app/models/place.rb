class Place < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validate :image_size

  private

  def image_size
    if image.size > 5.megabytes
      errors.add(:image, 'shoud be less than 5MB')
    end
  end
end
