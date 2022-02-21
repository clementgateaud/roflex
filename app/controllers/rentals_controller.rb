class RentalsController < ApplicationController
  before_action :set_params, only: [:create]
  def index
    @rentals = Rental.all
  end

  def show
    @rental = Rental.find(params[:id])
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(set_params)
    if @rental.save
      redirect_to rental_index(params[:id])
    else
      redirect_to :new
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @retal = Rental.find(params[:id])
    @restaurant.destroy
    redirect_to rental_index(params[:id])
  end

  private

  def set_params
    params.require(:rental).permit(:user_id, :offer_id, :start_time, :end_time)
  end
end
