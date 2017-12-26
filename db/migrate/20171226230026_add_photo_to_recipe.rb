class AddPhotoToRecipe < ActiveRecord::Migration[5.1]
  def up
    add_attachment :recipes, :photo
  end

  def down
    remove_attachment :recipe, :photo
  end
end
