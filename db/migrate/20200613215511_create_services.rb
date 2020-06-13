class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :service_name
      t.monetize :service_price
      t.timestamps
    end
  end
end
