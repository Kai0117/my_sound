class SoundInfo < ApplicationRecord
    has_many :favorite_sounds, dependent: :destroy
    has_many :favorited_users, through: :favorite_sounds, source: :user
end
