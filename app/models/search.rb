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

end
