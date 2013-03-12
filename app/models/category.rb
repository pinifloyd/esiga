class Category < ActiveRecord::Base

  has_many :products

  attr_accessible :name

  validates :name, presence: true, uniqueness: true

  before_destroy :clear_product_relations

  def self.for_select
    all.map { |category| [ category.name, category.id ] }
  end

  private

  def clear_product_relations
    Product.where(category_id: id).update_all(category_id: nil)
  end

end
