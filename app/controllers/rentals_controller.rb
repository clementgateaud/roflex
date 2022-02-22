class RentalsController < ApplicationController
  def index
    ## Rental.where(user == curent_user)
    @rentals = Rental.where(user: current_user)
    @rentals = policy_scope(Rental).order(created_at: :desc)
  end

  def show
    @rental = Rental.find(params[:id])
    authorize @rental
  end

  def new
    @rental = Rental.new
    authorize @rental
    @rental.total_amount = 42.42
    @offer = Offer.find(params[:id])
    @rental.offer = @offer
  end

  def create
    @rental = Rental.new(rental_params)
    authorize @rental
    @rental.user = current_user
    @rental.offer = Offer.find(params[:offer_id])
    @rental.total_amount = params[:total_amount]
    if @rental.save!
      redirect_to rental_path(@rental)
    else
      render :new
    end
  end

  def edit
    @rental = Rental.find(params[:id])
    authorize @rental
  end

  def update
    @rental = Rental.find(params[:id])
    authorize @rental
    @rental.user = current_user
    @rental.offer = Offer.find(params[:offer_id])
    @rental.total_amount = params[:total_amount]
    if @rental.update(rental_params)
      redirect_to rental_path(@rental)
    else
      render :new
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    authorize @rental
    @rental.destroy
    redirect_to rentals_path
  end

  private

  def rental_params
    params.require(:rental).permit(:user_id, :offer_id, :start_time, :end_time, :total_amount)
  end
end
