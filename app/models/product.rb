class Product < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :category, :title, :description, :price, presence: true
end
