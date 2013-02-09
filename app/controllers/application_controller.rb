class ApplicationController < ActionController::Base

  protect_from_forgery

  helper_method :nav_categories

  private

  def nav_categories
    @nav_categories ||= Category.all
  end

end
