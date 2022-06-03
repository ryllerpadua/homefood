class User < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :orders
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name, :address

  def avatar_thumbnail
    if avatar.attached?
        avatar.variant(resize: "150x150!").processed
    else
      "assets/avatar.png"
    end
  end
end


# <%= image_tag(current_user.avatar_thumbnail) %>
