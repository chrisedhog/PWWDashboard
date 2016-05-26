class PagesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:contact, :help]

  
  def admin
    if (current_user.has_role? :admin) || (current_user.has_role? :super_admin)
      @users = User.all
    else
      redirect_to root_path
    end
  end

  def help
  end

  def contact
  end
end
