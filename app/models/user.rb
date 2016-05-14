class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # , :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :confirmable
end