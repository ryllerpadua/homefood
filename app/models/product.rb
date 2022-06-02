class Product < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :photo

  validates :category, :title, :description, :price, presence: true
end
