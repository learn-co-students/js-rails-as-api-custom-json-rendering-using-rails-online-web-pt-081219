class BirdsController < ApplicationController
  def index
    birds = Bird.all
    #render json: birds
    # render json: birds, only: [:id, :name, :species]
    # http://localhost:3000/birds will now produce our array of bird objects and each object will only 
    # have the id, name and species values, leaving out everything else
    # or 
    # render json: birds, except: [:created_at, :updated_at]
    render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: {id: bird.id, name: bird.name, species: bird.species}
    # {"id":3,"name":"Common Starling","species":"Sturnus Vulgaris"}
    # render json: bird.slice(:id, :name, :species) 
    # get same result as above without update/create time

    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end


  end
end