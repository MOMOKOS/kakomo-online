class FoodsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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

  private

  def food_params
    params.require(:food).permit(:name, :price, :description, :genre_id, :drink_id, :scene_id, :allergy_id, :day_id,
                                 :image).merge(user_id: current_user.id)
  end
end
