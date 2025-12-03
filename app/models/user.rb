class User < ApplicationRecord
  has_many :favorite_sounds, dependent: :destroy
  has_many :favorite_sound_infos, through: :favorite_sounds, source: :sound_info

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  attribute :name, :string
  attribute :age,  :integer

  
   def greet
     if age <= 12
      "ぼくは#{name}だよ。"
     else
      "僕は#{name}です。"
     end
   end


   def child?
    age <= 12
   end
end
