class Client < ActiveRecord::Base
    has_many :project_clients
    has_many :projects, through: :project_clients

    has_many :users
    
    has_many :user_clients
    has_many :users, through: :user_clients

    has_many :search_clients
    has_many :searches, through: :search_clients

end
