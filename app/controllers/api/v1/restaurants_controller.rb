class Api::V1::RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  def index
    @restaurants = Restaurant.all
    render json: @restaurants
  end

  def show
    render json: @restaurant
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      render json: { messagge: 'Created correctly' }, status: :created
    else
      render json: {status: 404, message: "Character not found"}, status: 404
    end
  end

  def update
    if @restaurant
      @restaurant.update(restaurant_params)
      render json: { messagge: 'Restaurant was successfully updated.' }, status: 200
    else
      render error: { error: 'Unable to create Restaurant.' }, status: 400
    end
  end

  def destroy
    if @restaurant
      @restaurant.destroy
      render json: { messagge: 'Restaurant was successfully updated.' }, status: 200
    else
      render error: { error: 'Unable to create Restaurant.' }, status: 400
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :address, :city, :photo_url)
  end
end
