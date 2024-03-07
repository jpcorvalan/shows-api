class CharactersController < ApplicationController
  before_action :set_character, only: %i[ show update destroy ]

  rescue_from Exception do |e|
    # log.error "#{e.message}"
    render json: {error: e.message}, status: 500
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: {error: e.message}, status: :unprocessable_entity
  end

  rescue_from ActionController::ParameterMissing do |e|
    render json: {error: e.message}, status: :bad_request
  end


  # # GET /characters
  # def index
  #   @characters = Character.all

  #   render json: @characters, each_serializer: SimpleCharacterSerializer
  # end


  # GET /characters
  def index
    @characters = CharacterFinder.new(search_params).call

    render json: @characters, each_serializer: SimpleCharacterSerializer
  end

  # GET /characters/1
  def show
    render json: @character, serializer: CharacterSerializer
  end

  # def find_by_name
  #   @character = Character.find_by_name(params[:name])
  #   render json: @character, serializer: CharacterSerializer
  # end

  # POST /characters
  def create
    @character = Character.new(character_params)

    if @character.save
      render json: @character, status: :created, location: @character
    else
      render json: {error: @character.errors}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /characters/1
  def update
    if @character.update(character_params)
      render json: @character
    else
      render json: {error: @character.errors}, status: :unprocessable_entity
    end
  end

  # DELETE /characters/1
  def destroy
    @character.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def character_params
      params.require(:character).permit(:image, :name, :age, :weight, :history)
    end

    def permitted_params
      params.permit(:name)
    end

    def search_params
      permitted_params
    end
end
