class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_sign_up_params, only: [:create]

  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[location])
  end
end
