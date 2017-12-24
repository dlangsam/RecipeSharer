class User::RecipesController < ApplicationController
  before_action :authenticate_user!
  def index
    @current_user = current_user
    @recipes = current_user.recipes
  end

  def new
    @recipe = Recipe.new(user_id: current_user.id)
  end

  def create
    puts "inside create"
    @recipe = Recipe.new(recipe_params.merge(user_id: current_user.id))
    puts @recipe.inspect
    if @recipe.save
      redirect_to :user_recipes
    else
      puts "recipe failed"
      render 'new'
    end

  end

  def show

  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :description, :total_time, :prep_time, :special_notes)
  end
end
