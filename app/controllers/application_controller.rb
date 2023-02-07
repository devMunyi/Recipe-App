class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(_resource)
    public_recipes_url
  end

  def after_sign_in_path_for(_resource)
    public_recipes_url
  end

  def after_sign_out_path_for(_resource)
    new_user_session_url
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end
