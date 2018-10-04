class UserController < ApplicationController

  #Set all products for the current_user
  def index
    @user = current_user
    @products = Product.all.select{|p| p.user_id == @user.id}
  end

  def show 
    @users = current_user
  end

  def edit
    @product = Product.find(params[:id])
  end

  def new
    @product = current_user.products.build
  end

  def create
    @product = current_user.products.build(product_params)

    if @product.save
      redirect_to root_path
    else
      :abort
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, {:category_ids => []})
  end

end