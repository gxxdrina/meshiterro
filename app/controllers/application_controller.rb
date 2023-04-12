class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

  #サインインしたらAboutへ
  def after_sign_in_path_for(resource)
    about_path
  end
  
  #サインアウトしたらAboutへ
  def after_sign_out_path_for(resource)
    about_path
  end

  protected #呼び出された他のコントローラからも参照することができる
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end
