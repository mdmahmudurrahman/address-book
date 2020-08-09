class CreateContactAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_addresses do |t|
      t.string :title
      t.string :street
      t.string :street_no
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.float :latitude
      t.float :longitude
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
