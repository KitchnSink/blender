class RegistrationsController < Devise::RegistrationsController
  protected

  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end

  def after_sign_up_path_for(resource)
    '/user_profile'
  end
end
