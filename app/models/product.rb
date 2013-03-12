class Product < ActiveRecord::Base

  belongs_to :category

  attr_accessible :name, :price, :category_id

  validates :name, presence: true, uniqueness: true

  validates_numericality_of :price,
    allow_nil: true, only_integer: true, greater_than_or_equal_to: 0

  def category_name
    category.try(:name)
  end

end
