class CreateLeadServices < ActiveRecord::Migration[6.0]
  def change
    create_table :lead_services do |t|
      t.integer :service_id
      t.integer :lead_id
      t.timestamps
    end
  end
end
