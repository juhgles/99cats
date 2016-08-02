require 'date'
class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find_by(id: params[:id])
  end

  def new
    render :new
  end

  def create
    Cat.create!(cat_params)

    redirect_to cats_url
  end

  private
  def cat_params
    params.require(:cat).permit(:birth_date, :sex, :color, :name, :description)
  end
end
