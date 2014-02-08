class ReservationsController < ApplicationController
  before_filer :load_product

  def index
  end

  def show
  	@reservation = Reservation.find(params[:id])
  end

  def create
  	@reservation = @restaurant.reservations.build(reservation_params)
  	@reservation.user_id = current_user.id

  	if @reservation.save
  		redirect_to restaurants_path, notice: 'Reservation created successfully'
  	else
  		render :action => :show
  	end

  end

  def destroy
  	@reservation = Reservation.find(params[:id])
  	@reservation.destroy
  end

  def new
  end

  def edit
  end

  private
  def reservation_params
  	params.require(:reservation).permit(:time, :date, :restaurant_id, :guest_id, :number_of_guests)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurand_id])
  end

end

