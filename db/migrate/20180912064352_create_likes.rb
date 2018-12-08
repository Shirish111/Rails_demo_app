class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :user, index:true, foreign_key:{to_table: :users}
      t.references :post, index:true, foreign_key:{to_table: :posts}
      t.boolean :has_liked, null:false, default: 0
      t.timestamps
    end
  end
end
