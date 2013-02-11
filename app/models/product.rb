class Product < ActiveRecord::Base

  attr_accessible :name, :price

  validates :name, presence: true, uniqueness: true

  validates_numericality_of :price,
    allow_nil: true, only_integer: true, greater_than_or_equal_to: 0

end
