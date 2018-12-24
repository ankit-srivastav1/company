class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #devise_parameter_sanitizer.for(:account_update) << :name
  end

  def after_sign_in_path_for(users)
     offices_path
  end

  private

  def layout
    puts "----------->#{request.referer}"
    if devise_controller?
      "login"
    else
      "application"
    end
  end
end
