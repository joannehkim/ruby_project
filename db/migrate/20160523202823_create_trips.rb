class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :destination
      t.string :start_date
      t.string :end_date
      t.references :user, index: true, foreign_key: true
      t.string :description

      t.timestamps null: false
    end
  end
end
