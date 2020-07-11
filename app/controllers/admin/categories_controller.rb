class Admin::CategoriesController < Admin::ApplicationController
  before_action :set_category, only: %i[show destroy edit update]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = 'Successfully created category.'
      redirect_to admin_category_path(@category)
    else
      flash.now[:alert] = 'Category has not been created'
      render 'new'
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      flash[:success] = 'Category successfully updated'
      redirect_to admin_categories_path
    else
      flash[:error] = 'Couldnt update category'
      render 'edit'
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = 'Category deleted'
    else
      flash[:error] = 'Could not delete category'
    end
    redirect_to admin_categories_path
  end
  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
