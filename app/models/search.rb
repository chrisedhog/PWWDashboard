class Search < ActiveRecord::Base
has_many :search_clients
has_many :clients, through: :search_clients

has_many :search_all_projects
has_many :projects, through: :search_all_projects

    def search_projects(id)

        # The ID is coming through correctly. Just need to correctly sort through the data based off the client and proejct join tables

        projects = []
        search = Search.find(id)
        puts search.clients.first.to_s
        puts "********========="

        search.clients.each do |c|
            puts c.client_name.to_s
        end
        

        return projects
    end

    def self.past_sample_data
        { "Jan 2015" =>  3256870.00.to_d, 
         "Feb 2015" =>  4256870.00.to_d, 
         "Mar 2015" =>  5256870.00.to_d, 
         "Apr 2015" =>  6256870.00.to_d, 
         "May 2015" =>  7256870.00.to_d }
    end

    def self.forecast_sample_data
        { "Jan 2016" =>  8256870.00.to_d, 
         "Feb 2016" =>  9256870.00.to_d, 
         "Mar 2016" =>  10256870.00.to_d, 
         "Apr 2016" =>  11256870.00.to_d, 
         "May 2016"=>  12256870.00.to_d} 
    end
end
