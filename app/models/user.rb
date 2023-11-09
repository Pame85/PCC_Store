class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :products
  has_many :line_items
  
  # has_one :cart, dependent: :destroy

  # before_destroy :clear_cart

  # after_create :create_cart

  # private

  # def create_cart
  #   Cart.create(user: self)
  # end

  # def clear_cart
  #   if cart
  #     cart.destroy
  #   end
  # end
end
