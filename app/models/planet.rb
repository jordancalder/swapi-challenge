class Planet < ApplicationRecord
  API_AVAILABLE_ATTRIBUTES = [:name, :diameter, :rotation_period, :orbital_period, :gravity, :population, :climate, :terrain, :surface_water, :residents, :films, :url, :created, :edited]

  validates :swapi_id, :name, :diameter, :rotation_period, :orbital_period, :gravity, :population, :climate, :terrain,
            :surface_water, :residents, :films, :url, :created, :edited, presence: true

  def to_h
    {
      name: name,
      diameter: diameter,
      rotation_period: rotation_period,
      orbital_period: orbital_period,
      gravity: gravity,
      population: population,
      climate: climate,
      terrain: terrain,
      surface_water: surface_water,
      residents: JSON.parse(residents),
      films: JSON.parse(films),
      url: url,
      created: created,
      edited: edited
    }
  end
end
