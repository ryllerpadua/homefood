class ProductsController < ApplicationController
  def create
    @product = Product.new(product_params)
    @order = Order.find(params[:order_id])
    @product.order = @order
    if @product.save
      redirect_to @order
    else
      @users = User.all.order(:name)
      render 'orders/show'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to @product.order
  end

  private

  def product_params
    params.require(:product).permit(:category, :title, :description, :price)
  end
end
