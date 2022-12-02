class FixColumnLatitudeUser < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :latitud, :latitude
  end
end
