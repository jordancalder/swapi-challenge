class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.integer :swapi_id
      t.string :name
      t.string :birth_year
      t.string :eye_color
      t.string :gender
      t.string :hair_color
      t.string :height
      t.string :mass
      t.string :skin_color
      t.string :homeworld
      t.string :films, array: true, default: []
      t.string :species, array: true, default: []
      t.string :starships, array: true, default: []
      t.string :vehicles, array: true, default: []
      t.string :url
      t.string :created
      t.string :edited

      t.timestamps
    end

    add_index :people, :swapi_id, unique: true
  end
end
