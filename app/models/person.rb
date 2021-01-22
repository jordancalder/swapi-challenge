class Person < ApplicationRecord
  validates :swapi_id, :name, :birth_year, :eye_color, :gender, :hair_color, :height, :mass, :skin_color,
            :homeworld, :url, :created, :edited, presence: true
  validates :birth_year, format: { with: /\A(unknown|.*BBY|.*ABY)\z/ }
  validates :gender, inclusion: { in: %w(male female unknown n/a) }
  validate :is_created_iso_8601?, :is_edited_iso_8601?

  def to_h
    {
      name: name,
      height: height,
      mass: mass,
      hair_color: hair_color,
      skin_color: skin_color,
      eye_color: eye_color,
      birth_year: birth_year,
      gender: gender,
      homeworld: homeworld,
      films: films,
      species: species,
      vehicles: vehicles,
      starships: starships,
      created: created,
      edited: edited,
      url: url
    }
  end

  private

  def is_created_iso_8601?
      errors.add(:created, "created should be formatted as iso 8601") if ((Time.iso8601(created) rescue ArgumentError) == ArgumentError)
  end

  def is_edited_iso_8601?
      errors.add(:edited, "edited should be formatted as iso 8601") if ((Time.iso8601(edited) rescue ArgumentError) == ArgumentError)
  end
end
