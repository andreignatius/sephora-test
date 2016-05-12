class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @product
    else
      render 'new'
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def index
    @products = Product.all
  end
  
  private
    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
    
end
