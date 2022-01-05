# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # Проверяет статус входа пользователя.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to new_user_session_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
