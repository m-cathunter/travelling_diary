class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.text :city
      t.text :description
      t.text :temperature

      t.timestamps
    end
  end
end
