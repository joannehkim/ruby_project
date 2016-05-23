class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :place, index: true, foreign_key: true
      t.string :description

      t.timestamps null: false
    end
  end
end
