class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :post
      t.integer :user_id

      t.timestamps
    end
  end
end
