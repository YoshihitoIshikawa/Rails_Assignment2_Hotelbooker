class Room < ApplicationRecord
  has_one_attached :image
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :reservations

  def self.ransackable_attributes(auth_object = nil)
    %w[name address detail price]
  end

  def self.ransackable_associations(auth_object = nil)
      []
  end

  validates :name, presence: true
  validates :detail, presence: true
  validates :address, presence: true
  validates :price, presence: true
end
