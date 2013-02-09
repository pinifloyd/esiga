class Admin::ProductsController < Admin::BaseController

  before_filter :new_product,  only: [ :new, :create ]
  before_filter :load_product, only: [ :edit, :update, :destroy ]

  def index
    @products = Product.all
  end

  def new; end

  def create
    if @product.save
      redirect_to admin_products_path
    else
      render action: :new
    end
  end

  def edit; end

  def update
    if @product.update_attributes(params[:product])
      redirect_to admin_products_path
    else
      render action: :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to admin_products_path
    end
  end

  private

  def new_product
    @product = Product.new(params[:product])
  end

  def load_product
    @product = Product.find(params[:id])
  end

end
