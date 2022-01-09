class AddUniqueIndexToCategories < ActiveRecord::Migration[6.1]
  def up
    add_index :categories, :name, unique: true, where: 'active is true'
  end
  def down
    remove_index :categories, :name
  end
end
