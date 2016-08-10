class Search < ActiveRecord::Base
has_many :search_clients
has_many :clients, through: :search_clients

has_many :search_all_projects
has_many :projects, through: :search_all_projects

    def search_projects(id)

        puts id.to_s
        puts "************|||||||||"

        projects = []
        search = Search.find(id)
        puts search.clients.first.to_s
        puts "********========="
        
        puts search.clients(2).client_name[1].to_s
        puts "************|||||||||"

        search.clients.each do |c|
            puts c.client_name.to_s
        end
        
        # projects = Project.all

        # projects = projects.where(["client LIKE ?", client]) if client.present? 

        # client.each do |c|
        #     client_projects_array << projects.where(["client LIKE ?", c]) if c.present? 
        # end

        # unless client_projects_array.size == 0
        #     client_projects_array.each do |p|
        #         projects_array << projects.where(["project_name LIKE ?", p])
        #     end
        # end



        return projects_array
    end

end
