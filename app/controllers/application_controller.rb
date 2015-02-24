class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit( :name,
                :family_name,
                :middle_name,
                :phone,
                :city,
                :default_delivery_service,
                :default_delivery_point_address,
                :default_additional_info,
                :email, :password, :password_confirmation, :current_password )
    end
  end

end
