class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new #form_withに代入するモデル
  end
  
  #投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    #@post_image(投稿データ)のuser_idとcurrent_user.id(ログイン中ユーザーのID)を紐づけ
    @post_image.user_id = current_user.id 
    @post_image.save
    redirect_to post_images_path #投稿一覧画面
  end

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new #コメント
  end
  
  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path #PostImageの一覧
  end

  
  # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  
end
