class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.string :category
      t.references :place, index: true, foreign_key: true
      t.float :cost
      t.string :company
      t.string :description

      t.timestamps null: false
    end
  end
end
