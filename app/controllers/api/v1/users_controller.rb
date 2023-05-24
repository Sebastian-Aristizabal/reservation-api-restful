class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  before_action :check_owner, only: %i[update destroy]
  # GET /users/1id
  def show
    if @user
      render json: @user
    else
      render json: {status: 404, message: "user not found"}, status: 404
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: { messagge: 'Created correctly' }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user
      if @user.update(user_params)
        render json: { messagge: 'User was successfully updated.' }, status: 200
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      render json: {status: 404, message: "User not found"}, status: 404
    end
  end

  # DELETE /users/1
  def destroy
    if @user
      if @user.destroy
        render json: { messagge: 'User was successfully deleted.' }, stauts: 204
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      render json: {status: 404, message: "User not found"}, status: 404
    end
  end


  private

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def check_owner
    head :forbidden unless @user.id == current_user&.id
  end

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end
end
