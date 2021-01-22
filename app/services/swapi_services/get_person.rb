module SwapiServices
  class GetPerson

    def initialize(params)
      @id = params[:id]
    end

    def call
      response = HTTParty.get("#{SWAPI_HOST_URL}/people/#{@id}")
      payload = JSON.parse(response.body)

      if payload['detail']
        OpenStruct.new({ success?: false, error: payload['detail'] })
      else
        person = Person.create!(
          swapi_id: @id,
          name: payload['name'],
          birth_year: payload['birth_year'],
          eye_color: payload['eye_color'],
          gender: payload['gender'],
          hair_color: payload['hair_color'],
          height: payload['height'],
          mass: payload['mass'],
          skin_color: payload['skin_color'],
          homeworld: payload['homeworld'],
          films: payload['films'],
          species: payload['species'],
          starships: payload['starships'],
          vehicles: payload['vehicles'],
          url: payload['url'],
          created: payload['created'],
          edited: payload['edited']
        )

        OpenStruct.new({ success?: true, payload: person })
      end
    end

  end
end
