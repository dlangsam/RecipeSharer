class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :description
      t.string :special_notes
      t.integer :total_time
      t.integer :prep_time
      t.timestamps
    end
  end
end
