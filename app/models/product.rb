class Product < ApplicationRecord
  belongs_to :user
  belongs_to :sport
  has_many :bookings
end
