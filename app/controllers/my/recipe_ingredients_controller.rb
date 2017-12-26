class My::RecipeIngredientsController < ApplicationController
  def new
    @recipe_item = RecipeItem.new
    @recipe_item.build_ingredient
  end
end
