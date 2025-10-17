class AddTrackUrlToSoundInfos < ActiveRecord::Migration[7.0]
  def change
    add_column :sound_infos, :track_url, :string
  end
end
