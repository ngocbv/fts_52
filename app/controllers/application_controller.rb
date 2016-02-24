class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :config_devise_permitted_parameters, if: :devise_controller?

  def config_devise_permitted_parameters
    registration_params = [:name, :email, :avatar, :role, :charwork_id, :password, :password_confirmation]

    if params[:action] == "update"
      devise_parameter_sanitizer.for :account_update do |u|
        u.permit registration_params << :current_password
      end
    elsif params[:action] == "create"
      devise_parameter_sanitizer.for :sign_up do |u|
        u.permit registration_params
      end
    end
  end
end
