module SwapiServices
  class GetResource

    def initialize(params)
      @resource = params[:resource]
      @id = params[:id]
      @klass = params[:klass]
      @is_resource_cachable = params[:is_resource_cachable]
    end

    def call
      response = HTTParty.get("#{SWAPI_HOST_URL}/#{@resource}/#{@id}")

      payload = JSON.parse(response.body)

      if payload['detail']
        OpenStruct.new({ success?: false, error: payload })
      else
        attributes = payload.merge({ swapi_id: @id })

        payload = Object.const_get(@klass).create!(attributes) if @is_resource_cachable

        OpenStruct.new({ success?: true, payload: payload })
      end
    end

  end
end
