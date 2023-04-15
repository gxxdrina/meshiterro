class UsersController < ApplicationController
  #本人以外は編集できない
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id]) #ユーザーの取得
    @user.update(user_params) #ユーザーのアップデート
    redirect_to user_path(@user.id) #ユーザーの詳細ページへのパス  
  end


   private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
  #本人以外は編集できない
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end
  
end
