class My::RecipesController < ApplicationController
  before_action :authenticate_user!
  def index
    @current_user = current_user
    @recipes = current_user.recipes
  end

  def new
    puts "inside new"
    @recipe = Recipe.new
    @recipe.recipe_ingredients.build.build_ingredient
  end

  def create
    params[:recipe][:instructions] = params[:recipe][:instructions].to_json
    @recipe = current_user.recipes.build(recipe_params)
    build_recipe_ingredients

    if @recipe.save
      redirect_to :my_recipes
    else
      render "new"
    end
  end


  def update
    params[:recipe][:instructions] = params[:recipe][:instructions].to_json
    @recipe = Recipe.find_by(id: params[:format])

    if @recipe.update(recipe_params)
      redirect_to :my_recipes
    else
      render "edit"
    end
  end

  def edit
    @recipe = Recipe.find(params[:format])
    @instructions = JSON.parse(@recipe.instructions)
  end

  def show
    @recipe = Recipe.find_by(id: params[:format])
    @instructions = JSON.parse(@recipe.instructions)
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:format])
    @recipe.destroy

    redirect_to my_recipes_path
  end



  private
  def recipe_params
    params.require(:recipe).permit(:name, :description, :instructions, :total_time, :prep_time, :special_notes,
                                   recipe_ingredients_attributes: [:id, :amount, :unit_type, ingredient_attributes:[:name]])
  end

  def build_recipe_ingredients
    puts "build recipe ingredients"
    @recipe.recipe_ingredients.each do |recipe_item|
      recipe_item.ingredient = Ingredient.find_or_create_by(name: recipe_item.ingredient.name)
    end
  end


end
