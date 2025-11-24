class User < ApplicationRecord
  has_many :favorite_sounds, dependent: :destroy
  has_many :favorite_sound_infos, through: :favorite_sounds, source: :sound_info

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
