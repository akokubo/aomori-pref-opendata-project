class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :name
      t.float :lat
      t.float :lng
      t.text :description

      t.timestamps
    end
  end
end
