class ApplicationController < ActionController::Base
  before_action :authenticate_user! #:check_pass_changed

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # Couldn't get the below to work, it keeps saying too many
  #redirects & I also couldn't get the correct form to show up (where only the password could be changed, not the email)
  #   def check_pass_changed
  #   if user_signed_in?
  #     if current_user.change_pass = true
  #       redirect_to edit_user_registration_path, alert: "Test, you need to change your password"
  #     end
  #   end
  # end
  
end
