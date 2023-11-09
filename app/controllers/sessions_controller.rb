class SessionsController < Devise::SessionsController
    def destroy
      clear_cart_session
      super
    end
  
    private
  
    def clear_cart_session
      current_user.cart.destroy if current_user.cart.present?
      session.delete(:cart_id)
    end
  end
  