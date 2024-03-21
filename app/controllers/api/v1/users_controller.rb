class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: UserSerializer.new(@users).serializable_hash[:data].map { |user| user[:attributes] }
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: UserSerializer.new(@user).serializable_hash[:data][:attributes], status: :ok
    else
      render json: {errors: "User not found"}
    end
  end

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

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
