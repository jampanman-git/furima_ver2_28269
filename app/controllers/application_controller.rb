class ApplicationController < ActionController::Base
  before_action :authenticate,except: [:index,:show]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end
  
  def authenticate
    redirect_to new_user_registration_url unless user_signed_in?
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:last_name,:first_name,:last_name_kana,:first_name_kana,:birthday,:email])
  end
end
