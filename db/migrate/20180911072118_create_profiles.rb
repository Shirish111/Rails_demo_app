class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :firstname
      t.string :lastname
      t.date :dateofbirth
      t.text :description
      t.string :gender
      t.references :user, index: true, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
