class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @product = Product.new
    @users = User.all.order(:name)
  end

  def new
    @product = Product.find(params[:product_id])
    @order = Order.new
    # sum = @sum
    # @sum = @product.price.to_i * 3
    # return @sum
  end

  def create
    @product = Product.find(params[:product_id])
    @order = Order.new(order_params)
    @order.product = @product
    @order.user = current_user
    if @order.save
      redirect_to @order
      # redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:quantity)
  end
end
