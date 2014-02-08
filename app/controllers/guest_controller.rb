class GuestController < ApplicationController

  def new
  	@guest = Guest.new
  end

  def create
  	@guest = Guest.new(user_params)
  	if @guest.save
  		redirect_to restaurants_url, :notice => "Signed up!"
  	else
  		render "new"
  	end
  end

  private
  def user_params
  	params.require(:guest).permit(:first_name, :last_name, :email, :telephone, :password, :password_confirmation)
  end

end
