class RestaurantsController < ApplicationController
  def index
  	@restaurants = Restaurant.all
  end

  def show
  	@restaurant = Restuarant.find(params[:id])
  end

  def new
  	@restaurant = Restaurant.find(params[:id])
  end

  def edit
  	@restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(Restaurant_params)

    if @restaurant.save
      redirect_to Restaurants_url
    else
      render :new
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update_attributes(Restaurant_params)
      redirect_to Restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to Restaurants_path
  end

  private
  def Restaurant_params
    params.require(:Restaurant).permit(:name, :description, :price_in_cents)
  end
end

