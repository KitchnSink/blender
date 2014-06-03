class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Getting rid of this for now, we'll use gamer tags in the Player object
  # before_filter :configure_permitted_parameters, if: :devise_controller?

  # protected

  #   def configure_permitted_parameters
  #     devise_parameter_sanitizer.for(:sign_up) do |u|
  #       u.permit :username, :email, :password, :password_confirmation
  #     end
  #   end
end
