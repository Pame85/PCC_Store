class ShoppingCartsController < ApplicationController  
    def create
      @product = Product.find(params[:product_id])
      @shopping_cart.add(@product, @product.price)
      redirect_to shopping_cart_path
    end
  
    def show
      
    end
  end