class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :author
      t.string :published
      t.text :content
      t.integer :likes
      t.integer :views
      t.string :like_pic
      t.string :title_pic

      t.timestamps
    end
  end
end
