class GuitarsController < ApplicationController

  def index 
    @guitars = Guitar.all
    render :index
  end 

  def show 
    @guitar = Guitar.find_by(id: params[:id])
    render :show
  end 

  def create 
    @guitar = Guitar.new(
      name: params[:name], 
      price: params[:price],
      user_id: params[:user_id] #add current user to this 
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
