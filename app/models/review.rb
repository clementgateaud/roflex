class Review < ApplicationRecord
  belongs_to :offer
  validates :content, presence: true, length: { minimum: 5 }
  validates :rating, presence: true, inclusion: 1..5
end
