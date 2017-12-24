class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.string :description, null: false
      t.integer :recipe_id, null: false
      t.integer :order, null: false
      t.timestamps
    end
  end
end
