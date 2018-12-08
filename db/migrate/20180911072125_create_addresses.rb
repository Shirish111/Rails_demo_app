class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :streetname
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.references :user, index:true, foreign_key:{to_table: :users}
      t.timestamps
    end
  end
end
