class HomeController < ApplicationController
# skip_before_action :authenticate_user!
  def index
  # Unless a user has already set up a profile, they will be required to create one.
    unless current_user.profile
      redirect_to new_profile_path
    end
  end
end
