class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # , :timeoutable and :omniauthable, , :confirmable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable
         
 has_one :profile, dependent: :destroy
 
 has_many :user_clients
 has_many :clients, through: :user_clients  

 #the below can be called on the user to grab their list of clients
 def self.users_clients(user_id)
    user_id.clients.all.each do |myclient|
            [] << myclient.client_name.to_s
    end
 end

end
