class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :post_id
      t.integer :likes
      t.string :like_pic
      t.string :title_pic

      t.timestamps
    end
  end
end
