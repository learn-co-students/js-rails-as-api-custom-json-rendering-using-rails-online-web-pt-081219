class BirdsController < ApplicationController

  #slice doesnt work on arrays
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    # render json: birds, except: [:created_at, :updated_at]
    #above is faster if we dont wanna list out everything we want. we can just list the few we dont
  end
 
  # def show
  #   bird = Bird.find_by(id: params[:id])
  #   render json: bird
  # end
  # (Above every attribute for bird is rendered)
  # def show
  #   bird = Bird.find_by(id: params[:id])
  #   render json: {id: bird.id, name: bird.name, species: bird.species } 
  # end
  # (above we pick and choose the attributes rendered)
  # Here, we've created a new hash out of three keys, assigning the keys manually with the attributes of bird.
#below is top refractored

# Rather than having to spell out each key, the Hash slice method returns a new hash with only the keys that are passed into slice. In this case, :id, :name, and :species 
# were passed in, so created_at and updated_at get left out, just like before.
  def show
bird = Bird.find_by(id: params[:id])
if bird 
  render json: bird.slice(:id, :name, :species)
else
  render json: { message: 'Bird not found' }
end

end
end