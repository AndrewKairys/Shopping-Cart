class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:user_id]
      @products = User.find(params[:user_id]).products
    else
      @category = Category.find(params[:category_id])
      @products = @category.products.order(:name)
    end
  end

  def edit
    @category = Category.find(params[:category_id])
  end

  def show
    @category = Category.find(params[:category_id])
  end

  def new
    @product = current_user.products.build
  end

  def create
    @product = current_user.products.build(product_params)

    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to category_products_path
    else
      render :new
    end 
  end

  def destroy
    if @product.destroy
      redirect_to category_products_path
    else
      :abort
    end
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, {:category_ids => []})
    end
end