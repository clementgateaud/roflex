class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :show

  def index
    # @offers = Offer.all
    @offers = policy_scope(Offer).order(created_at: :desc)
  end

  def show
    authorize @offer
  end

  def new
    @offer = Offer.new
    authorize @offer
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    authorize @offer
    if @offer.save!
      redirect_to offer_path(@offer), notice: 'Offer was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @offer
  end

  def update
    authorize @offer
    @offer.update(offer_params)
    redirect_to offer_path(@offer)
  end

  def destroy
    authorize @offer
    @offer.destroy
    redirect_to offers_path
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:name, :price, :photo, :description, :avaibility)
  end
end
