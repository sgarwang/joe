class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string  :name
      t.integer :position
      t.timestamps
    end

    # Each event has its own category_id
    add_column :events, :category_id, :integer
    add_index :events, :category_id
  end
  
  
end
