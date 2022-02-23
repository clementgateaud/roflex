class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @offers = Offer.all
  end

  def dashboard

  end
end
