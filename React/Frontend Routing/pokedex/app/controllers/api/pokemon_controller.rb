class Api::PokemonController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    sleep 0.5
    @pokemons = Pokemon.all
    render :index
  end

  def show
    sleep 0.5
    @pokemon = Pokemon.find(params[:id])
    render :show
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      render :show
    else
      render json: @pokemon.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(
      :name,
      :attack,
      :defense,
      :poke_type,
      :image_url,
      :moves => [],
    )
  end
end
