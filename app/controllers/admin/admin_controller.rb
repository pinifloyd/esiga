class Admin::AdminController < ActionController::Base

  protect_from_forgery

  before_filter :authenticate_user!

  after_filter :success_create, only: :create
  after_filter :success_update, only: :update

  helper_method :category_exists?

  private

  def success_create
    flash[:success] = I18n.t('admin.base.success_create')
  end

  def success_update
    flash[:success] = I18n.t('admin.base.success_update')
  end

  def category_exists?
    Category.exists?
  end

end
