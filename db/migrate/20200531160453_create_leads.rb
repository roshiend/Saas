class CreateLeads < ActiveRecord::Migration[6.0]
  def change
    create_table :leads do |t|
    	t.string :title
    	t.string :person_name
    	t.string :valid_phone_number
    	t.string :valid_email_address

    	t.string  :current_house_name_or_number
      t.string  :current_street_name
      t.string  :current_post_code
      t.string  :current_house_bedrooms
      t.string  :current_house_house_type
      t.string  :current_house_issues


      t.string  :new_house_name_or_number
      t.string  :new_street_name
      t.string  :new_post_code
      t.string  :new_house_bedrooms
      t.string  :new_house_house_type
      t.string  :new_house_issues

      t.string   :expected_removal_day
      
    	t.timestamps
    end
  end
end
