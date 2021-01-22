require 'rails_helper'

RSpec.describe "Api::Resources", type: :request do
  describe "GET show" do
    let(:swapi_id) { 1 }
    let(:person) { Person.create!(
      swapi_id: swapi_id,
      name: 'name',
      height: 'height',
      mass: 'mass',
      hair_color: 'hair_color',
      skin_color: 'skin_color',
      eye_color: 'eye_color',
      birth_year: '19BBY',
      gender: 'male',
      homeworld: 'homeworld',
      films: [],
      species: [],
      vehicles: [],
      starships: [],
      created: '2021-01-21T09:21:11.061346Z',
      edited: '2021-01-21T09:21:11.061346Z',
      url: 'url'
    ) }

    before do
      get api_path('people', swapi_id)
    end

    it "returns http success" do
      expect(response.status).to eq(200)
    end
  end
end
