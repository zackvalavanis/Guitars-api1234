class GuitarsController < ApplicationController
  before_action :authorize_user, only: [:create, :update, :destroy]

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
      user_id: current_user.id #add current user to this 
    )
    @guitar.save
    render :show
  end 

  def update 
    @guitar = Guitar.find_by(id: params[:id])
    @guitar.update(
      name: params[:name] || @guitar.name, 
      price: params[:price] || @guitar.price,
      user_id: params[:user_id] || @guitar.user_id
    )
    render :show
  end

  def destroy 
    @guitar = Guitar.find_by(id: params[:id])
    @guitar.destroy
    render json: {message: 'The guitar has been removed!'}
  end 
end
