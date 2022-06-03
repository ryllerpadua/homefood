class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :quantity, presence: true
  validates :quantity, numericality: { in: 0..100, message: "cannot be more than 100." }
end
