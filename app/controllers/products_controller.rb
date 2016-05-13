class ProductsController < ApplicationController
  
  before_action :admin_user, only: :destroy
  
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
    redirect_to users_url
  end
  
  def index
    @products = Product.paginate(page: params[:page])
  end
  
  private
    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
