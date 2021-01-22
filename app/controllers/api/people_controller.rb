module Api
  class PeopleController < ApplicationController
    def show
      swapi_id = params[:id]

      person = Person.find_by(swapi_id: swapi_id)

      if person.nil?
        response = SwapiServices::GetPerson.new(id: swapi_id).call

        return response.error unless response.success?

        person = response.payload
      end

      render json: person.to_h, status: 200
    end
  end
end
