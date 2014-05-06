class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :prevent_caching
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :set_ng_csrf_token

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name
  end

  def prevent_caching
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "0"
  end

  # Dealing with CSRF token issues.
  def set_ng_csrf_token
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end
end

