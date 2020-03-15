class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    #render json: birds, except: [:created_at, :updated_at] "This is the same as above"
    #render json: birds.to_json(except: [:created_at, :updated_at]) "This is what is actually happening"
  end
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
      # or render json: bird.slice(:id, :name, :species)
    else
      render json: { message: 'Bird is not found' }
    end
  end
end