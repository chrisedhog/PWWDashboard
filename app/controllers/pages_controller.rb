class PagesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:contact]
  
  def admin
    if (current_user.has_role? :admin) || (current_user.has_role? :super_admin)
      @users = User.all
    else
      redirect_to root_path
    end
  end

  def contact
  end
  
  def manage_users
  # Uncomment the below to test our the passing params through POST to page. (in routs there is a manage_users as POST)
  #  @name = params[:name]
  
    if (current_user.has_role? :admin) || (current_user.has_role? :super_admin)
      @users = User.all
      @clients = Client.all
      @profiles = Profile.all.order('first_name ASC')
    else
      redirect_to root_path, alert: 'Sorry, you do not have permission to access this area.'
    end
  end

end
