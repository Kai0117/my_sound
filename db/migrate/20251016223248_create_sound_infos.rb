class CreateSoundInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :sound_infos do |t|
      t.text :content
      t.string :mood
      t.string :title
      t.string :artist
      t.string :cover_url

      t.timestamps
    end
  end
end
