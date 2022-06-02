class Product < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :photo

  validates :category, :title, :description, :price, presence: true

# CATEGORY = ['Pastry', 'Drinks', 'Packed Lunch', 'Chinese', 'Sweets', 'Healthy', 'Sushi', 'Pizza', 'Pasta', 'Barbecue', 'Breakfast', 'Desert', 'Sandwich', 'Brazilian', 'Frozen', 'Arab' ]

end
