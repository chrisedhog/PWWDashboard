class SearchAllProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :search
end
