class ChangeDateDataTypeToDatetime < ActiveRecord::Migration
  def change
  	remove_column(:trips, :start_date)
  	add_column(:trips, :start_date, :datetime)
  	remove_column(:trips, :end_date)
  	add_column(:trips, :end_date, :datetime)
  	remove_column(:places, :datetime)
  	add_column(:places, :datetime, :datetime)
  end
end
