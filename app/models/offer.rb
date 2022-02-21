class Offer < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_many :users, through: :rentals
  validates :name, presence: true
  validates :price, presence: true
  validates :photo_url, presence: true
  validates :description, presence: true
end
