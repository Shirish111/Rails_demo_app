class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :path, null:false, default: ""
      t.string :name
      t.references :user, index:true, foreign_key:{to_table: :users}
      t.timestamps
    end
  end
end
