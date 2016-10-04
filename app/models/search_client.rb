class SearchClient < ActiveRecord::Base
  belongs_to :client
  belongs_to :search
end
