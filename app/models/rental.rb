class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :total_amount, presence: true
end
