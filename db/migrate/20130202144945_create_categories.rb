class CreateCategories < ActiveRecord::Migration

  def change
    create_table :categories, force: true do |t|
      t.column :name, :string
    end
  end

end
