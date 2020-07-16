class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :nationalId
      t.string :name
      t.string :lastName
      t.integer :age
      t.string :originPlanet
      t.string :pictureUrl

      t.timestamps
    end
  end
end
