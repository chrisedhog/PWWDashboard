class Client < ActiveRecord::Base
    has_many :projects
    has_many :users
    
    has_many :user_clients
    has_many :users, through: :user_clients

end
