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
        { "Jan 2015" => 3256870.00.to_d,
          "Feb 2015" => 3825580.00.to_d,
          "Mar 2015" => 4394290.00.to_d,
          "Apr 2015" => 5550000.00.to_d,
          "May 2015" => 6044000.00.to_d,
          "Jun 2015" => 7100000.00.to_d,
          "Jul 2015" => 7700000.00.to_d,
          "Aug 2015" => 8154000.00.to_d,
          "Sep 2015" => 8860000.00.to_d,
          "Oct 2015" => 9200000.00.to_d,
          "Nov 2015" => 9500000.00.to_d,
          "Dec 2015" => 9600328.45.to_d }
    end

    def self.forecast_sample_data
        { "Jan 2016" => 3916752.11.to_d,
          "Feb 2016" => 4626643.23.to_d,
          "Mar 2016" => 5146264.25.to_d,
          "Apr 2016" => 6148854.32.to_d,
          "May 2016" => 6640724.57.to_d,
          "Jun 2016" => 7409783.48.to_d,
          "Jul 2016" => 8263054.46.to_d,
          "Aug 2016" => 8488001.54.to_d,
          "Sep 2016" => 8837809.10.to_d,
          "Oct 2016" => 9068047.68.to_d,
          "Nov 2016" => 9402019.15.to_d,
          "Dec 2016" => 9513505.72.to_d } 
    end
end