class ApplicationController < ActionController::Base

  protect_from_forgery

  helper_method :all_categories, :current_category

  private

  def all_categories
    @categories ||= Category.all
  end

  def current_category
    # Abstract method
  end

end
