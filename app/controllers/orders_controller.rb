class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    authorize @order
    @product = Product.new
    @users = User.all.order(:name)
  end

  def new
    @product = Product.find(params[:product_id])
    @order = Order.new
    authorize @order
  end

  def create
    @product = Product.find(params[:product_id])
    @order = Order.new(order_params)
    authorize @order
    @order.product = @product
    @order.user = current_user
    if @order.save
      redirect_to @order, notice: '🎉 Purchase completed successfully. 🎉'
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
