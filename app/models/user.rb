class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :invites
<<<<<<< HEAD
  has_many :benefit, through: :trades
=======
  has_many :benefits, through: :trades
>>>>>>> b940265a8eb2c640d8baf55d4f8322f13841611d
  has_many :trades
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :photo, PhotoUploader
  validates :name, presence: true
end
