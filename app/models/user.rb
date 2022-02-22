class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rentals
  has_many :offers
  has_many :offers, through: :rentals
  has_one_attached :photo
  # validates :username, presence: true
  # validates :email, presence: true
  # validates :last_name, presence: true
  # validates :first_name, presence: true
  # validates :phone_number, presence: true
  # validates :profile_picture_url, presence: true
end
