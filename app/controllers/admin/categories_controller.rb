class Admin::CategoriesController < Admin::BaseController

  before_filter :new_category,  only: [ :new, :create ]
  before_filter :load_category, only: [ :edit, :update, :destroy ]

  def index
    @categories = Category.all
  end

  def new; end

  def create
    if @category.save
      redirect_to admin_categories_path
    else
      render action: :new
    end
  end

  def edit; end

  def update
    if @category.update_attributes(params[:category])
      redirect_to admin_categories_path
    else
      render action: :edit
    end
  end

  def destroy
    if @category.destroy
      redirect_to admin_categories_path
    end
  end

  private

  def new_category
    @category = Category.new(params[:category])
  end

  def load_category
    @category = Category.find(params[:id])
  end

end
