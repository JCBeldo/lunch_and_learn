class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.new(user), status: 200
    else
      render json: { errors: 'Invalid credentials' }, status: 400
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end