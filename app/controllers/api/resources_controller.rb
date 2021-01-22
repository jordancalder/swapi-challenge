module Api
  class ResourcesController < ApplicationController

    CACHED_RESOURCES = ['people', 'planets'].freeze

    def show
      resource = params[:resource]
      swapi_id = params[:id]

      klass = resource.capitalize.singularize

      cached_resource = nil

      if is_resource_cachable?(resource)
        cached_resource = Object.const_get(klass).find_by(swapi_id: swapi_id)
      end

      if cached_resource.nil?
        response = SwapiServices::GetResource.new(resource: resource, id: swapi_id, klass: klass, is_resource_cachable: is_resource_cachable?(resource)).call

        return response.error unless response.success?

        cached_resource = response.payload
      end

      render json: cached_resource.to_h, status: 200
    end

    private

    def is_resource_cachable?(resource)
      CACHED_RESOURCES.include?(resource)
    end
  end
end
