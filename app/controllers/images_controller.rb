class ImagesController < ApplicationController

  def create
    photo = image_params[:photo]
    image_params = {}
    if photo != nil
      image_params[:photo] = photo.read
    end
    @image = Image.new(image_params)
    end
end
