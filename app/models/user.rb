class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Userモデルの定義 deviseで使用する機能が記述されている
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
