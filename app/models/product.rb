class Product < ApplicationRecord
  belongs_to :user
  belongs_to :order, optional: true

  has_one_attached :image
  has_many_attached :images
  has_many :products  
end


