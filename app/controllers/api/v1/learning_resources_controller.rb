class Api::V1::LearningResourcesController < ApplicationController
  def index
    video = YoutubeFacade.new.country_videos(params[:country])
    photo = UnsplashFacade.new.country_photos(params[:country])

    if video.empty? && photo.empty?
      render json: LearningResourceSerializer.new.empty_data_format(params[:country]), status: 200
    else
      render json: LearningResourceSerializer.new.format_data(params[:country], video.first, photo), status: 200
    end
  end
end