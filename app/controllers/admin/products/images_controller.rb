class Admin::Products::ImagesController < Admin::ApplicationController
  before_action :set_product
  before_action :set_image, only: %i[destroy]

  def destroy
    if @image.destroy
      flash[:success] = 'Image successfully destroyed'
    else
      flash[:error] = 'Could not delete image'
    end
    redirect_to admin_product_path(@product)
  end

  def create
    @product.images.attach(params[:images])
    redirect_to admin_product_path(@product)
  end

  private

  def set_image
    @image = @product.images.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
