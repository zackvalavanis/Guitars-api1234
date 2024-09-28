class GuitarsController < ApplicationController
  before_action :authorize_user

  def index 
    
    if current_user.id
      @guitars = Guitar.where(user_id: current_user.id)
      render :index
    else 
      render json: { error: 'Unauthorized Access' }, status: :unauthorized 
    end
  end 

  def show 
    @guitar = Guitar.find_by(id: params[:id], user_id: current_user.id)
    if @guitar 
    render :show
    else 
      render json: { error: 'Unauthorized User'}, status: :unauthorized
    end
  end 

  def create 
    @guitar = Guitar.new(
      name: params[:name], 
      price: params[:price],
      user_id: current_user.id  # Add current user to this 
    )
  
    if @guitar.save
      if params[:'Url[]'].present?
        Rails.logger.debug "Building images with URLs: #{params[:'Url[]']}"
        params[:'Url[]'].each do |url|
          if url.present?
            @guitar.images.build(url: url)
            Rails.logger.debug "Image built with URL: #{url}"
          end
        end 
      end
  
      # Save the guitar again to persist the images
      if @guitar.save
        render :show, status: :created  # Render the show template with a created status
      else
        render json: @guitar.errors, status: :unprocessable_entity  # Handle validation errors
      end 
    else
      render json: @guitar.errors, status: :unprocessable_entity  # Handle validation errors
    end 
  end
  
  
  def update 
    @guitar = Guitar.find_by(id: params[:id], user_id: current_user.id)
    @guitar.update(
      name: params[:name] || @guitar.name, 
      price: params[:price] || @guitar.price,
      user_id: params[:user_id] || @guitar.user_id
    )
    render :show
  end

  def destroy 
    @guitar = Guitar.find_by(id: params[:id], user_id: current_user.id)
    @guitar.destroy
    render json: {message: 'The guitar has been removed!'}
  end 

  def authorize_user 
    unless current_user
      render json: { error: 'Unauthorized user'}, status: :unauthorized
    end
  end
end
