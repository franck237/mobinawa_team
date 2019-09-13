class ApplicationController < ActionController::Base
  helper_method :admin_signed_in?, :current_admin, :filter_on_signed_in

  before_action :configure_devise_parameters, if: :devise_controller?
  before_action :set_locale

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:firstname, :lastname, :email, :number,:function, :country_id, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:firstname, :lastname, :email, :number,:function, :country_id, :password, :password_confirmation, :current_password)}
  end

  def filter_on_signed_in
    unless admin_signed_in?
      flash[:danger] = "You need to Signin  in order to access this page"
      redirect_to root_path
    end
  end

  def admin_signed_in? 
    return admin_signed_in?
  end

  def get_admin_id
    @admin = Admin.find(params[:id])
  end

  private

  def set_locale
    I18n.locale = "fr"
  end 

end
