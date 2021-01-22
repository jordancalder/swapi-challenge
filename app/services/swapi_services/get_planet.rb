module SwapiServices
  class GetPlanet

    def initialize(params)
      @id = params[:id]
    end

    def call
      response = HTTParty.get("#{SWAPI_HOST_URL}/planets/#{@id}")
      payload = JSON.parse(response.body)
      puts payload

      if payload['detail']
        OpenStruct.new({ success?: false, error: payload['detail'] })
      else
        planet = Planet.create!(
          swapi_id: @id,
          name: payload['name'],
          diameter: payload['diameter'],
          rotation_period: payload['rotation_period'],
          orbital_period: payload['orbital_period'],
          gravity: payload['gravity'],
          population: payload['population'],
          climate: payload['climate'],
          terrain: payload['terrain'],
          surface_water: payload['surface_water'],
          residents: payload['residents'],
          films: payload['films'],
          url: payload['url'],
          created: payload['created'],
          edited: payload['edited']
        )

        OpenStruct.new({ success?: true, payload: planet })
      end
    end

  end
end
