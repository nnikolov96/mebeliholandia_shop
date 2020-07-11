class Admin::ProductsController < Admin::ApplicationController
  before_action :set_product, only: %i[show destroy edit update]

  def index
    @products = Product.all.includes(:category)
    if params[:category].present?
      category = Category.find(params[:category])
      @products = @products.where(category: category)
    end
    @products = @products.where("name ILIKE ?", "%#{params[:name]}%") if params[:name].present?
    @products = @products.order(params[:order]) if params[:order].present?
    @pagy, @products = pagy(@products, items: 10)
  end

  def show; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Successfully created product'
      redirect_to admin_product_path(@product)
    else
      flash[:alert] = 'Cannot create product due to following errors'
      render :new
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      flash.now[:notice] = 'Product has been updated successfully'
      redirect_to admin_product_path(@product)
    else
      flash.now[:error] = 'Cannot create product due to following errors'
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = 'Successfully deleted a product'
    else
      flash[:error] = 'Could not delete product'
    end
    redirect_to admin_products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id, images: [])
  end
end
