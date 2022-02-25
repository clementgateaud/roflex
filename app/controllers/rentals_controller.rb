class RentalsController < ApplicationController
  def index
    @rentals = policy_scope(Rental).where(user: current_user)
  end

  def show
    @rental = Rental.find(params[:id])
    authorize @rental
  end

  def create
    @rental = Rental.new(rental_params)
    authorize @rental
    @rental.user = current_user
    @rental.offer = Offer.find(params[:offer_id])
    nb_days = (@rental.end_time - @rental.start_time).to_i + 1
    @rental.total_amount = (nb_days * @rental.offer.price).round(2)
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
    @rental.update(rental_params)
    nb_days = (@rental.end_time - @rental.start_time).to_i + 1
    @rental.update(total_amount: (nb_days * @rental.offer.price).round(2))
    redirect_to rentals_path
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
