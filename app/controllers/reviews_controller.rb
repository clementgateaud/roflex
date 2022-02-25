class ReviewsController < ApplicationController

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @offer = Offer.find(params[:offer_id])
    @review.offer = @offer
    @review.save
    redirect_to offer_path(@offer)
    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
