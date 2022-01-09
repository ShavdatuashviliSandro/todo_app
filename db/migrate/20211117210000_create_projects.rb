class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.references :title, { null: false, foreign_key: true }
      t.string :format
      t.text :description

      t.timestamps
    end
  end
end
