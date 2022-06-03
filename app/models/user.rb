class User < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :orders
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name, :address


end
