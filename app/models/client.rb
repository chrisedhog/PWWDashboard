class Client < ActiveRecord::Base
    has_many :projects, dependent: :destroy

    has_many :users
    
    has_many :user_clients
    has_many :users, through: :user_clients, dependent: :destroy

    has_many :search_clients
    has_many :searches, through: :search_clients, dependent: :destroy

end
