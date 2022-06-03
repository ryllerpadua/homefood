class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  before_action :set_product_authorization, only: %i[show edit update destroy]

  def index
    # @products = Product.all , foi substituido pelo policy abaixo.
    @products = policy_scope(Product)
    if params[:query].present?
      @products = Product.search_by_title(params[:query])
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
    @order = Order.new
  end

  def new
    @product = Product.new
    authorize @product
    @categories = ['Arab', 'Barbecue', 'Brazilian', 'Burguer', 'Drinks', 'Chinese', 'Frozen', 'Healthy', 'Hot Dog', 'Italian', 'Packed Lunch', 'Pastry', 'Pizza', 'Sandwhich', 'Sushi', 'Sweets', 'Other']
  end

  def create
    @product = Product.new(product_params)
    authorize @product
    @product.user = current_user
    @product.save
    redirect_to products_path, notice: 'Product was successfully created !'
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to product_path(@product), notice: 'Product was successfully updated !'
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: 'Product was successfully deleted !'
  end

  private

  def product_params
    params.require(:product).permit(:category, :title, :description, :price, :photo)
  end

  def set_product_authorization
    @product = Product.find(params[:id])
    authorize @product
  end
end
