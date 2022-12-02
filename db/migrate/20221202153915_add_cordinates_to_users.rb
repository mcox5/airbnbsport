class AddCordinatesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :latitud, :float
    add_column :users, :longitude, :float
  end
end
