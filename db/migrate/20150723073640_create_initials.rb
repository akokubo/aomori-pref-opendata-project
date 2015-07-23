class CreateInitials < ActiveRecord::Migration
  def change
    create_table :initials do |t|
      t.integer :zoom
      t.float :lat
      t.float :lng
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
