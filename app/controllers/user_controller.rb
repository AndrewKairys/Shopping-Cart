 class UserController < ApplicationController
#   before_action :set_product, only: [:show, :edit, :update, :destroy]
#   before_action :authenticate_user!
  #Set all products for the current_user
#   def index
#     @user = current_user
#     @products = Product.all.select{|p| p.user_id == @user.id}
#   end

#   def show 
#     @products = current_user.products
#   end

#   def edit
#     @product = Product.find(params[:id])
#   end

#   def new
#     @product = current_user.products.build
#   end

#   def create
#     @product = current_user.products.build(product_params)

#     if @product.save
#       redirect_to root_path
#     else
#       :abort
#     end
#   end

#   def destroy
#     @product.destroy
#     redirect_to category_products_path
#   end

#   private

#   def set_product
#     @product = Product.find(params[:id])
#   end

#   def product_params
#     params.require(:product).permit(:name, :description, :price, {:category_ids => []})
#   end

 end