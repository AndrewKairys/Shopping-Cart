class OrderItemsController < ApplicationController
  include CurrentCart
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:create]
  before_action :authenticate_user!, except: [:destroy]

  def new
    @order_item = OrderItem.new
  end

  def create
    product = Product.find(params[:product_id])
    @order_item = @cart.add_product(product)
    @order_item.save
    redirect_to @order_item.cart
  end

  def destroy
    @cart = Cart.find(session[:cart_id])
    @order_item.destroy
    redirect_to cart_path(@cart)
  end

  private

    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    def order_item_params
      params.require(:order_item).permit(:product_id)
    end
end
