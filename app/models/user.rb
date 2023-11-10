class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :shopping_cart_items
  has_one :shopping_cart, dependent: :destroy

  after_create :create_shopping_cart

  private

  def create_shopping_cart
    Cart.create(user: self)
  end
end
