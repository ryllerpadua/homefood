class ProductsController < ApplicationController
  before_action :set_product_authorization, only: %i[show edit update destroy]

  def index
    # @products = Product.all , foi substituido pelo policy abaixo.
    @products = policy_scope(Product)
  end

  def show
  end

  def new
    @product = Product.new
    authorize @product
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
    params.require(:product).permit(:category, :title, :description, :price)
  end

  def set_product_authorization
    @product = Product.find(params[:id])
    authorize @product
  end
end
