class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [patient_attributes: ["id", "user_id", "first_name", "last_name_father", "last_name_mother", "gender", "birth_date", "civil_status", "occupation", "phone", "street", "colony", "zip_code", "city", "state", "rfc", "created_at", "updated_at", "heard_about_us"]])
  end
end
