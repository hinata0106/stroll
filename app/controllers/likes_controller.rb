class LikesController < ApplicationController

    def create
      like = current_user.likes.create(image_id: params[:image_id]) 
      redirect_back(fallback_location: root_path)
    end
  
    def destroy
      like = Like.find_by(image_id: params[:image_id], image_id: current_user.id)
      like.destroy
      redirect_back(fallback_location: root_path)
    end
  
  end