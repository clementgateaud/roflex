class Offer < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_many :users, through: :rentals
  #has_many_attached :photos
  validates :name, presence: true
  validates :price, presence: true
  has_one_attached :photo
  validates :description, presence: true
end
