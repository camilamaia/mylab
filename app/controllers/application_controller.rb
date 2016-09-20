require 'yaml'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_filter :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_lab

  def current_lab
    current_user.current_lab ||= current_user.laboratories.first
  end

  protected

      def configure_permitted_parameters
          devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :current_lab_id) }
          devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :current_lab_id) }
      end

end
