class AddAttributesToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :title_pic, :string
    add_column :posts, :like_pic, :string
  end
end
