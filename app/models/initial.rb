class Initial < ApplicationRecord
  validates :zoom, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 21 }
  validates :lat, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :lng, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :title, presence: true, length: { maximum: 255 }
  validate :check_count, on: :create

  def lat_max
    Place.maximum(:lat)
  end

  def lat_min
    Place.minimum(:lat)
  end

  def lng_max
    Place.maximum(:lng)
  end

  def lng_min
    Place.minimum(:lng)
  end

  private

    def check_count
      if Initial.count >= 1
        errors[:base] << "設定値は複数登録できません。"
      end
    end
end
