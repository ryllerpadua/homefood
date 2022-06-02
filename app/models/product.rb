class Product < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :photo

  validates :category, :title, :description, :price, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title,
    against: [:title],
    using: {
      tsearch: { prefix: true }
    }
end
