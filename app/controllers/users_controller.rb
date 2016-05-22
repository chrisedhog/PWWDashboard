class UsersController < ApplicationController

    def make_admin
        @user = User.find(params[:id])
        @user.add_role :admin
        @user.remove_role :super_admin
        redirect_to :back, alert: 'Role changed to admin.'
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
    
end

