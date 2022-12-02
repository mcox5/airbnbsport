class Product < ApplicationRecord
  belongs_to :user
  belongs_to :sport
  has_many :bookings
  has_one_attached :photo
  include PgSearch::Model
  pg_search_scope :products_search,
  against: [ :name, :description ],
  using: {
    tsearch: { prefix: true }
  }
end
