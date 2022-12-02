class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]


  def index
    #@products = policy_scope(Product)
    #@sports = Sport.all
    if params[:query].present?
      @products = policy_scope(Product.products_search(params[:query]))
    else
      @products = policy_scope(Product)
    end
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    authorize @product
    if @product.save!
      redirect_to products_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find(params[:id])
    @marker = { lat: @product.user.latitude, lng: @product.user.longitude }
    authorize @product
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    if @product.save
      redirect_to products_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    # No need for app/views/restaurants/destroy.html.erb redirect_to restaurants_path, status: :see_other
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :sport_id, :photo)
  end
end
