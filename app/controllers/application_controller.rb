class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token
	before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def ensure_current_user
    if current_user.profile.nil?
      redirect_to root_path
  end
end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [ profile_attributes: [:name, :dob, :address, :image, :user_id]])
  end
end
 