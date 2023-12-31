class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: { errors: user.errors.full_messages }, status: 400
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :api_key)
  end
end
