class CreateProducts < ActiveRecord::Migration

  def change
    create_table :products, force: true do |t|
      t.column :name, :string
    end
  end

end
