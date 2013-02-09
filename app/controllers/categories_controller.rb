class CategoriesController < ApplicationController

  before_filter :current_category, only: :show

  def show; end

  private

  def current_category
    @category ||= Category.find(params[:id])
  end

end
