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
  
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:success] = "Product profile updated"
      redirect_to @product
    else
      render 'edit'
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:success] = "Product deleted"
    redirect_to products_url
  end
  
  def index
   #  @products = ProductsLoader.new('makeup').products
    @products = Product.paginate(page: params[:page])
  end
  
  private
    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
    
end
