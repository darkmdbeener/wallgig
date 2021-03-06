class ApplicationController < ActionController::Base
  class AccessDenied < CanCan::AccessDenied; end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters,       if: :devise_controller?
  before_action :track_online_user,                    if: :user_signed_in?
  before_action :authorize_rack_mini_profiler_request, if: proc { user_signed_in? && current_user.developer? }

  helper UsersHelper
  helper_method :last_deploy_time
  helper_method :current_profile
  helper_method :current_purities
  helper_method :current_settings
  helper_method :myself?
  helper_method :users_online

  rescue_from AccessDenied,         with: :access_denied_response
  rescue_from CanCan::AccessDenied, with: :access_denied_response

  protected

  def authenticate_admin_user!
    raise AccessDenied unless current_user.try(:admin?) || current_user.try(:moderator?)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :password, :remember_me) }
  end

  def last_deploy_time
    @last_deploy_time ||= File.new(Rails.root.join('last_deploy')).atime rescue nil
  end

  def current_profile
    @current_profile ||= begin
      if user_signed_in?
        current_user.profile
      else
        UserProfile.new
      end
    end
  end

  def current_purities
    current_settings.purities
  end

  def current_settings
    @current_settings ||= begin
      if user_signed_in?
        current_user.settings
      else
        UserSetting.new
      end
    end
  end

  def myself?(user = nil)
    user ||= @user
    user_signed_in? && user.present? && user.class.name == 'User' && current_user.id == user.id
  end

  def access_denied_response(exception)
    respond_to do |format|
      format.html { redirect_to root_url, alert: exception.message }
      format.json do
        response = {
          error: {
            message: exception.message
          }
        }
        render json: response, status: :unauthorized
      end
    end
  end

  def users_online
    @users_online ||= ::UsersOnlineService.new
  end

  def track_online_user
    users_online.track_user(current_user) unless current_settings.invisible?
  end

  def authorize_rack_mini_profiler_request
    Rack::MiniProfiler.authorize_request
  end
end
