class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  def create
    byebug
    super
    if current_user.admin?
      AdminLog.log user: current_user, action: Settings.users.action.login
    end
  end

  def destroy
    byebug
    if current_user.admin?
      AdminLog.log user: current_user, action: Settings.users.action.logout
    end
    super
  end

  protected
  def configure_sign_in_params
    devise_parameter_sanitizer.for(:sign_in) << :attribute
  end
end
