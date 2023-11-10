class SessionsController < Devise::SessionsController
    def destroy
      clear_shopping_cart_session
      super
    end
  
    private
  
    def clear_shopping_cart_session
      current_user.shopping_cart.destroy if current_user.shopping_cart.present?
      session.delete(:shopping_cart_id)
    end
  end
  