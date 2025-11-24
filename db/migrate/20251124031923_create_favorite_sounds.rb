class CreateFavoriteSounds < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_sounds do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sound_info, null: false, foreign_key: true

      t.timestamps
    end
  end
end
