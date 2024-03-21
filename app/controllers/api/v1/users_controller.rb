class Api::V1::UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      render json: UserSerializer.new(@user).serializable_hash[:data][:attributes], status: :created
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: UserSerializer.new(@user).serializable_hash[:data][:attributes], status: :ok
    else
      render json: {errors: @user.errors.full_messages}
    end

  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render json: {message: "User deleted"}, status: :ok
    else
      render json: {errors: @user.errors.full_messages}
    end
  end
end
