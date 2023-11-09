class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart
    if @cart
      @line_items = @cart.line_items
    end
  end

  def add_to_cart
    product = Product.find(params[:id])
    @cart = current_user.cart || current_user.build_cart
    line_item = @cart.line_items.find_or_initialize_by(product: product)
    line_item.quantity += 1
    line_item.save
    redirect_to cart_path
  end

  def destroy
    current_cart.line_items.destroy_all
    redirect_to root_path, notice: 'Cart cleared successfully.'
  end
  
  def update
    @cart = current_user.cart
    # Update cart attributes or perform other actions
    redirect_to cart_path
  end

  def checkout
    @cart = current_user.cart
    # Perform checkout process
    redirect_to order_confirmation_path
  end
end