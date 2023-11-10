class ProductsController < ApplicationController
    before_action :set_product, only: [:index, :show, :edit, :update, :destroy]
  
    def index
      @products = Product.all
    end
  
    def new
      @product = Product.new
    end

    def create
      @product = current_user.products.new(product_params)
      if @product.save
        redirect_to products_path, notice: 'Product was successfully created.'
      else
        flash[:alert] = 'Product could not be saved.'
        render :new
      end
    end

    def show
      @product = Product.find(params[:id])
    end
    
    def edit
    end
  
    def update
      @product.update(product_params)
      if params[:product][:image].present?
        @product.image.attach(params[:product][:image])
      end
    
      if @product.save
        redirect_to product_path(@product)
      else
        render :edit
      end
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy

      redirect_to products_path, notice: 'Product was successfully deleted.'
    end

    def add_to_cart
      @product = Product.find(params[:id])
      
      redirect_to cart_path, notice: "Product added to cart successfully."
    end

    private
      def set_product
        @product = Product.find(params[:id])
      end
    
      def product_params
        params.require(:product).permit(:name, :description, :price, images: [])
      end
  
end
  