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

  def self.set_default
    initial = Initial.last
    default_params = {zoom: 9, lat: 40.479863, lng: 141.562804, title: 'Wikiフィールドノート', description: 'これは八戸工業大学小久保温研究室で開発したアプリです。<br>マップ上で、自分の好きな場所を登録して、自分だけの地図を作りましょう。<br>場所を登録するには、編集モードに切り替え、マップで登録したい地点をクリックします。'}
    if initial
      initial.update_attributes(default_params)
    else
      Initial.create(default_params)
    end
  end

  private

    def check_count
      if Initial.count >= 1
        errors[:base] << "設定値は複数登録できません。"
      end
    end
end
