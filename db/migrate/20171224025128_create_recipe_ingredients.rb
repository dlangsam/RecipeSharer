class CreateRecipeIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id, null: false
      t.integer :ingredient_id, null: false
      t.integer :order
      t.decimal :amount
      t.string :unit_type
      t.timestamps
    end
  end
end
