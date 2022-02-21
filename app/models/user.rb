class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rentals
  has_many :offers
  has_many :offers, through: :rentals
  validates :username, presence: true
  validates :email, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :phone_number, presence: true
  validates :photo_url, presence: true
end
