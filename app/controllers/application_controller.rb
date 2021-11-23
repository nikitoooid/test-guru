class ApplicationController < ActionController::Base

  protected

  def after_sign_in_path_for(resource)
    flash[:notice] = "Hello, #{current_user.first_name}!"
    resource.admin? ? admin_tests_path : tests_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:first_name, :last_name, :email, :password)
    end
  end

end
