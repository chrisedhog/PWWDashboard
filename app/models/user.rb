class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # , :timeoutable and :omniauthable, , :confirmable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :invitable
         
 has_one :profile, dependent: :destroy
 
 has_many :user_clients
 has_many :clients, through: :user_clients, dependent: :destroy


    def client_projects
            projects = []
        clients.each do |c|
            projects << c.projects
        end
    end

end
