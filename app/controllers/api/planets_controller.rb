module Api
  class PlanetsController < ApplicationController
    def show
      swapi_id = params[:id]

      planet = Planet.find_by(swapi_id: swapi_id)

      if planet.nil?
        response = SwapiServices::GetPlanet.new(id: swapi_id).call

        return response.error unless response.success?

        planet = response.payload
      end

      render json: planet.to_h, status: 200
    end
  end
end
