class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # , :timeoutable and :omniauthable, , :confirmable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable
         
 has_one :profile

end
