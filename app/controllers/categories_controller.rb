class CategoriesController < ApplicationController

  before_filter :load_categories, only: [ :index, :show ]

  def index; end

  def show
    @category = Category.find(params[:id])
  end

  private

  def load_categories
    @categories = Category.all
  end

end
