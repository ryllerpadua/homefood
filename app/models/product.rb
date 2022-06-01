class Product < ApplicationRecord
  belongs_to :user
  has_many :orders

# CATEGORY = ['italian', 'japenese', 'brasilian', 'arab']

end
