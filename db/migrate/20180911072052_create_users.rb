class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, null: false, default: "", index:{unique: true}
      t.string :email, null: false, default: "", index:{unique: true}
      t.string :password, null: false, default: ""
      t.integer :profilepic, null:false, default: -1
      t.timestamps
    end
  end
end
