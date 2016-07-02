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
    @name = params[:name]
    # @user2 = User.find(7)
    # @user2.clients << [1]

    if (current_user.has_role? :admin) || (current_user.has_role? :super_admin)
      @users = User.all
      @clients = Client.all
    else
      redirect_to root_path
    end
  end
  
  def add_client
    @user = User.find(params[:selected_user])
    @client = Client.find(params[:client])
    @user.clients << @client
    redirect_to :back
  end
  
  def remove_client
    @user = User.find(params[:selected_user])
    @client = Client.find(params[:client])
    @user.clients.delete(@client)
    redirect_to :back
  end
  
end
