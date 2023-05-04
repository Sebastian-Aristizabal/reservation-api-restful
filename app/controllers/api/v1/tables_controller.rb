class Api::V1::TablesController < ApplicationController
# before_action :set_restaurant, only: %i[show edit update destroy]
  def index
    @tables = Table.where(restaurant_id: params[:restaurant_id])
    render json: @tables
  end

  # def show
  #   render json: @restaurant
  # end

  def new
    @table = Table.new
  end

  # def edit
  # end

  def create
    @table = Table.new(table_params)
    @table.restaurant_id = params[:restaurant_id]
    if @table.save
      render json: { messagge: 'Creado correctamente' }, status: :created
    else
      render json: { error: @table.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  # def update
  #   if @restaurant
  #     @restaurant.update(restaurant_params)
  #     render json: { messagge: 'Restaurant was successfully updated.' }, status: 200
  #   else
  #     render error: { error: 'Unable to create Restaurant.' }, status: 400
  #   end
  # end

  # def destroy
  #   if @restaurant
  #     @restaurant.destroy
  #     render json: { messagge: 'Restaurant was successfully updated.' }, status: 200
  #   else
  #     render error: { error: 'Unable to create Restaurant.' }, status: 400
  #   end
  # end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def table_params
    params.require(:table).permit(:number, :restaurant_id)
  end
end
