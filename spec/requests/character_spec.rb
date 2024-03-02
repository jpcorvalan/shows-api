require 'rails_helper'

RSpec.describe "Characters", type: :request do

  # ------------------ GET Methods - Start ------------------

  # Sin datos en la DB falsa
  describe "GET /characters" do

    it "GET /index should return OK" do
      get '/characters'
      payload = JSON.parse(response.body)
      expect(payload).to be_empty
      expect(response).to have_http_status(200)
    end
  end

  # Con datos en la BD falsa
  describe "GET /index with data in DB" do

    # Creamos una variable que va a poder usarse en el bloque "it"
    # create_list es una funcionalidad de "factory_bot"
    let!(:characters) {
      create_list(:character, 10)
    }

    # Serializamos la lista para que los datos solo contengan los campos necesarios
    let!(:serializedCharacters) {
      ActiveModelSerializers::SerializableResource.new(characters, each_serializer: SimpleCharacterSerializer).to_json
    }

    it "should return all characters list" do
      get '/characters'
      serialized = JSON.parse(serializedCharacters)
      payload = JSON.parse(response.body)

      expect(payload).to eq(serialized)
      expect(response).to have_http_status(200)
    end

  end

  # Debe devolver el detalle del character
  describe "GET /character/{id}" do
    let!(:character) {
      create(:character)
    }

    it "should return character detail" do
      get "/characters/#{character.id}"
      payload = JSON.parse(response.body)

      expect(payload).to_not be_empty
      expect(payload['id']).to eq(character.id)
      expect(response).to have_http_status(200)
    end
  end

  # Debe devolver 404 si el detalle del Character no existe
  # describe "GET /character/{invalidId}" do
  #   it "should return 404 if characterId doesn't exists" do
  #     get "/characters/0"

  #     expect(response).to have_http_status(404)
  #   end
  # end

  # ------------------ GET Methods - End ------------------
  #
  #
  #
  #
  # ------------------ POST Methods - Start ------------------


  describe "POST /characters" do
    let!(:character){
      create(:character).to_json
    }

    it "should create a new Character" do

      post "/characters", params: {character: JSON.parse(character)}

      payload = JSON.parse(response.body)

      expect(payload).to_not be_empty
      expect(response).to have_http_status(:created)
    end

    it "should return error message on invalid Character" do

      req_payload = {
        image: "urlImage.com"
      }

      post "/characters", params: {character: req_payload}

      payload = JSON.parse(response.body)

      expect(payload).to_not be_empty
      expect(payload["error"]).to_not be_nil
      expect(response).to have_http_status(:unprocessable_entity)

    end

    it "should return error message on empty value or missing params" do
      post "/characters", params: {character: {}}

      payload = JSON.parse(response.body)

      expect(payload).to_not be_empty
      expect(payload["error"]).to_not be_nil
      expect(response).to have_http_status(:bad_request)
    end

  end


  # ------------------ POST Methods - End ------------------
  #
  #
  #
  #
  # ------------------ PUT Methods - Start ------------------


  describe "PUT /characters/{id}" do
    let!(:character) {
      create(:character)
    }

    put_payload = {
      image: "randomImageUrl.com",
      name: "Random Funny Name",
      age: 99,
      weight: "100.99",
      history: "Lorem Ipsum"
    }

    it "should modify a Character" do

      put "/characters/#{character.id}", params: {character: put_payload}

      # La respuesta obligadamente devuelve el ID del registro que se modificó
      res_payload = JSON.parse(response.body)

      expect(res_payload).to_not be_empty

      # Y comprobamos que el ID devuelto en la respuesta, sea igual que el ID del Character que creó FactoryBot
      expect(res_payload['id']).to eq(character.id)
      expect(response).to have_http_status(:ok)
    end
  end


  # ------------------ PUT Methods - End ------------------



end
