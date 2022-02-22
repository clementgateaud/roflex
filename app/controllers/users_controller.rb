class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :phone_number)
  end
end
