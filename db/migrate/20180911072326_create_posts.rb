class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :user, index: true, foreign_key:{to_table: :users}
      t.text :description
      t.string :imgpath, null:false, default: ""
      t.timestamps
    end
  end
end
