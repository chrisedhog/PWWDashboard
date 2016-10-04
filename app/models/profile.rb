class Profile < ActiveRecord::Base
  belongs_to :user
  accepts_nested_attributes_for :user
  
  validates :first_name, :last_name, :company_name, :country, :city, :direct_number, :position, presence: true
  
  def full_name
    first_name + ' ' + last_name
  end

end
