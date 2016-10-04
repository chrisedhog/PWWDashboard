class UsersController < ApplicationController

    def make_admin
        @user = User.find(params[:id])
        @user.add_role :admin
        @user.remove_role :super_admin
        redirect_to :back, alert: 'Role changed to Admin.'
    end
    
    def make_super_admin
        @user = User.find(params[:id])
        @user.add_role :super_admin
        @user.remove_role :admin
        redirect_to :back, alert: 'Role changed to Super Admin.'
    end
        
    def remove_roles
        @user = User.find(params[:id])
        @user.remove_role :admin
        @user.remove_role :super_admin
        redirect_to :back, alert: 'Role changed to User.'
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to :back
    end
    
    def invite_user
        User.invite!({:email => params[""]}, current_user)
    end

    def assign_clients
        @user = User.find(params[:user_id])
        @user.update(user_params)
        redirect_to :back, notice: 'Assigned clients have been updated.'
    end
    
    private

    def user_params
        params.require(:user).permit(client_ids: [])
    end
end

