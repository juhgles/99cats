require 'date'

class CatRentalRequestsController < ApplicationController

  def index
    @requests = CatRentalRequest.all
    render :index
  end

  def create
    CatRentalRequest.create!(cat_rental_params)
  end

  def new
    @cat_rental_request
  end

  private
  def cat_rental_params
    params.require(:cat_rental).permit(:cat_id, :start_date, :end_date, :status)
  end
end
