class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :quantity, presence: true
  validates :quantity, numericality: { less_than: 101, message: "cannot be more than 100." }
end
