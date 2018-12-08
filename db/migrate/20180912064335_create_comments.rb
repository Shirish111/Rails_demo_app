class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :user, index:true, foreign_key:{to_table: :users}
      t.references :post, index:true, foreign_key:{to_table: :posts}
      t.text :message
      t.timestamps
    end
  end
end
