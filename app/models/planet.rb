class Planet < ApplicationRecord
  validates :swapi_id, :name, :diameter, :rotation_period, :orbital_period, :gravity, :population, :climate, :terrain,
            :surface_water, :residents, :films, :url, :created, :edited, presence: true
end
