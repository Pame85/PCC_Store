class Order < ApplicationRecord

    has_many :order_items, dependent: :destroy

    validates_presence_of :email

    after_create :generate_order_reference

    def generate_order_reference
        prefix = 'LFS-'
        randomnumber = (SecureRandom.random_number(9e5) + 1e5).to_i

        self.reference = prefix + randomnumber.to_s
        self.save
    end
end
