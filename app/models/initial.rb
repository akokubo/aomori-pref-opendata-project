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
    self.zoom        ||= 14
    self.lat         ||= 40.784056
    self.lng         ||= 140.781172
    self.title       ||= 'Open Campus'
    self.description ||= 'これは青森大学のオープンキャンパスのワークショップ用のアプリです。<br>マップ上で、自分の好きな場所を登録して、自分だけの地図を作りましょう。'
  end
end
