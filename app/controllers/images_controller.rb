class ImagesController < ApplicationController
  def index 
    @images = Image.all
    render :index
  end 

  def show 
    @image = Image.find_by(id: params[:id])
    render :show
  end 

  def create 
    @image = Image.new(
      url: params[:url], 
      guitar_id: params[:guitar_id]
    )
    @image.save
    render :show
  end 

  def update 
    @image = Image.find_by(id: params[:id])
    @image.update(
      url: params[:url] || @image.url, 
      guitar_id: params[:guitar_id] || @image.guitar_id
    )
    render :show
  end

  def destroy 
    @image = Image.find_by(id: params[:id])
    @image.destroy
    render json: {message: 'The guitar has been removed!'}
  end 
end
