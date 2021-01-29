class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show, :new, :create]

  def index
    @foods = Food.order('created_at DESC')
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
      redirect_to food_path
    else
      render :edit
    end
  end

  def destroy
    if @food.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :price, :description, :genre_id, :drink_id, :scene_id, :allergy_id, :day_id,
                                 :image).merge(user_id: current_user.id)
  end

  def set_food
    @food = Food.find(params[:id])
  end

  def move_to_index
    @food = Food.find(params[:id])
    unless current_user.id == @food.user_id
      redirect_to action: :index
    end
  end
end
