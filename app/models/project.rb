class Project < ActiveRecord::Base
require 'csv'
has_one :project_clients
has_one :clients, through: :project_clients

has_many :search_all_projects
has_many :searches, through: :search_all_projects

#The below is not in use...can't get it to work
    def sort_projects
        # myclients = []
        # current_user.clients.all.each do |myclient|
        #     myclients << myclient.client_name
        # end

        # return myclients
    end


    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            
            project_hash = row.to_hash
            project = Project.where(id: project_hash["id"])
            
            project_hash.map do |key, value|
                puts key.to_s
                puts value.to_s
            end
            
            p_temp = {}
            p_temp[:client] = project_hash["client"]
            p_temp[:project_status] = project_hash["pipeline stage"]
            p_temp[:project_name] = project_hash["project no/name"]
            p_temp[:completion_date] = project_hash["completion date"]
            p_temp[:completion_month] = project_hash["completion date month/year"]
            p_temp[:budget_revenue] = project_hash["projected revenue"].gsub!(/,/,'').to_f
            p_temp[:budget_margin] = project_hash["projected margin (ext wtime)"].gsub!(/,/,'').to_f
            p_temp[:created_at] = project_hash["Date created"].to_datetime
            
            found_project = Project.order('created_at DESC').find_by(:project_name => p_temp[:project_name])
            found_client = Client.find_by(:client_name => p_temp[:client])
            
            if (found_project)
                if (found_project.created_at.month == Time.zone.now.month )
                    found_project.update_attributes(p_temp)
                else
                    Project.create!(p_temp)
                    found_client.projects << Project.last
                end
            elsif (found_client)
                Project.create!(p_temp)
                found_client.projects << Project.last
            else
                Project.create!(p_temp)
                Client.create!(client_name: p_temp[:client])
                c_temp = Client.find_by(:client_name => p_temp[:client])
                c_temp.projects << Project.last
            end
        end
    end
    
    def budget_margin_pct
        ((budget_margin / budget_revenue) * 100).round(2)
    end

    def self.search(search)
        if search
            where(["client_name LIKE ?","%#{search}%"])
        else
            
        end
    end

    def project_name_with_date
       "[" + created_at.strftime('%b %Y') + "] " + project_name unless created_at.nil? || project_name.nil?
    end

    def created_month
       created_at.strftime('%b %Y')
    end

end
