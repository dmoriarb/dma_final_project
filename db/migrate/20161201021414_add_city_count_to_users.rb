class AddCityCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :cities_count, :integer
  end
end
