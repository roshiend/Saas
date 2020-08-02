class ApplicationController < ActionController::Base
	layout 'frontend/application'
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action  :go_to_subdomain

 protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password,:subdomain,:password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password,:subdomain,:password_confirmation)}
  end

  def go_to_subdomain
  	return if self.is_a?(DeviseController)
  	if current_user.present? && request.subdomain != current_user.subdomain
  		redirect_to backend_root_url(subdomain: current_user.subdomain)
  	end
  end

  def after_sign_in_path_for(resource_or_scope)
  	root_url(subdomain :resource_or_scope.subdomain)
  end



end
