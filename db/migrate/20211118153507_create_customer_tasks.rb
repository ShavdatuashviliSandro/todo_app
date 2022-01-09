class CreateCustomerTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_tasks do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true

    end
  end
end
