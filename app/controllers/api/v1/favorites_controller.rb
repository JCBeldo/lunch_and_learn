class Api::V1::FavoritesController < ApplicationController
  def create 
    user = User.find_by(api_key: params[:api_key])
    return error unless user
    
    new_fave = Favorite.create(favorite_params)

    new_fave.update(user_id: user.id)

    render json: { success: 'Favorite successfully created' }, status: 201
  end

  def index
    user = User.find_by(api_key: params[:api_key])
    return error unless user

    user_faves = user.favorites
    render json: FavoriteSerializer.new(user_faves), status: 200
  end

  private 

  def favorite_params
    params.permit(:user_id, :recipe_link, :recipe_title, :country)
  end

  def error 
    render json: { errors: 'Invalid credentials' }, status: 401
  end
end
