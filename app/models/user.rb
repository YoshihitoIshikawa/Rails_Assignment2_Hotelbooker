class User < ApplicationRecord
  has_one_attached :image
  mount_uploader :image, ImageUploader
  has_many :rooms
  has_many :reservations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
