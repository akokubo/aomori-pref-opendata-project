class Initial < ActiveRecord::Base
  after_initialize :set_default

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

  def set_default
    self.zoom        ||= 9
    self.lat         ||= 40.479863
    self.lng         ||= 141.562804
    self.title       ||= 'Wikiフィールドノート'
    self.description ||= 'これは八戸工業大学小久保温研究室で開発したアプリです。<br>マップ上で、自分の好きな場所を登録して、自分だけの地図を作りましょう。'
  end
end
