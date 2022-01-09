class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.bigint :product_id
      t.string :product_type
      t.decimal :quantity

      t.timestamps
    end
  end
end
