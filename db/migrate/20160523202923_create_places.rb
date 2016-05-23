class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :location
      t.references :trip, index: true, foreign_key: true
      t.string :description
      t.string :datetime

      t.timestamps null: false
    end
  end
end
