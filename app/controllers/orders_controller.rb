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
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order
      # redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :quantity)
  end
end
