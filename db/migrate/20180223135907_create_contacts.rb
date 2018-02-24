class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :last_name
      t.string :first_name
      t.string :address1
      t.string :address2
      t.string :city
      t.integer :zip
      t.string :country
      t.string :telephone

      t.timestamps
    end
  end
end
