class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_filter :authenticate_user!, only: [:new, :edit, :update, :destroy]

  before_action :update_allowed_parameters, if: :devise_controller?

  def after_sign_up_path_for(_resource)
    budget_categories_path
  end

  def after_sign_in_path_for(_resource)
    budget_categories_path
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :surname, :email, :password, :current_password)
    end
  end
end
