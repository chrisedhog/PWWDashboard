class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # , :timeoutable and :omniauthable, , :confirmable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable
         
 has_one :profile, dependent: :destroy
 
 has_many :user_clients
 has_many :clients, through: :user_clients
end
