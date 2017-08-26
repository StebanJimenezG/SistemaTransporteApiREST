class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :placa
      t.string :color
      t.integer :año
      t.integer :categoria

      t.timestamps
    end
  end
end
