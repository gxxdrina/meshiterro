class PostImage < ApplicationRecord
    
  # 画像を持たせる
  has_one_attached :image
  # userに属している
  belongs_to :user
  
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
   
  def get_image
    unless image.attached? #画像設定ない時、no_image.jpgという画像をActiveStorageに格納し表示する
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image 
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
