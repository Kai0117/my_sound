class FavoriteSound < ApplicationRecord
  belongs_to :user
  belongs_to :sound_info

  validates :user_id, uniqueness: { scope: :sound_info_id }
end
