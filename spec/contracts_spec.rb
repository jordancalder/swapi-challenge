require "rails_helper"
require 'net/http'

describe "API schema" do
  it "matches person cache data schema" do
    uri = URI('https://swapi.dev/api/people/schema')

    Net::HTTP.start(uri.host, uri.port,
      :use_ssl => uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new uri

      response = http.request request
      expect(response.class.body_permitted?).to eq(true)

      response_json = JSON.parse(response.body)

      expect(response_json['required']).to match_array(Person::API_AVAILABLE_ATTRIBUTES.map(&:to_s))
    end
  end

  it "matches planet cache data schema" do
    uri = URI('https://swapi.dev/api/planets/schema')

    Net::HTTP.start(uri.host, uri.port,
      :use_ssl => uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new uri

      response = http.request request
      expect(response.class.body_permitted?).to eq(true)

      response_json = JSON.parse(response.body)

      expect(response_json['required']).to match_array(Planet::API_AVAILABLE_ATTRIBUTES.map(&:to_s))
    end
  end
end
