class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      #id（投稿画像を識別するID）も含まれている
      t.string :shop_name #お店の名前
      t.text :caption #画像の説明
      t.integer :user_id #投稿したユーザーを識別するID（usersテーブルのIDを保存する）

      t.timestamps
    end
  end
end
