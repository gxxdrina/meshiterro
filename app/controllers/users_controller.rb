class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images #ユーザーが投稿した投稿画像を全て
  end

  def edit
  end
end
