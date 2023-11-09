# app/helpers/cart_helper.rb
module CartHelper
    def create_cart
        if user_signed_in? && current_user.cart.nil?
            cart = Cart.create(user: current_user)
        else
            current_user.cart
        end   
    end
end
  