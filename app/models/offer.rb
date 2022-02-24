class Offer < ApplicationRecord
  belongs_to :user # le vendeur
  has_many :rentals
  has_many :users, through: :rentals
  #has_many_attached :photos
  validates :name, presence: true
  validates :price, presence: true
  has_one_attached :photo
  validates :description, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
