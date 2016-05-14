class Profile < ActiveRecord::Base
  belongs_to :user
  
  validates :first_name, :last_name, :company_name, :country, :city, :direct_number, :position, presence: true
  
end
