class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:last_name,:first_name,:last_name_kana,:first_name_kana,:birthday,:email,:password])
  end
end
