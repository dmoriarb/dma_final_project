class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :user_id
      t.integer :temp_c
      t.string :temp_f
      t.integer :weather
      t.string :city_name

      t.timestamps

    end
  end
end
