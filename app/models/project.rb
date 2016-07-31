class Project < ActiveRecord::Base
require 'csv'

#The below is not in use...can't get it to work
    def sort_projects
        myclients = []
        current_user.clients.all.each do |myclient|
            myclients << myclient.client_name
        end

        return myclients
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
            p_temp[:project_status] = project_hash["project status"]
            p_temp[:project_name] = project_hash["project no/name"]
            p_temp[:completion_date] = project_hash["completion date"]
            p_temp[:completion_month] = project_hash["project completion date month/year"]
            p_temp[:budget_revenue] = project_hash["de budget revenue"].gsub!(/,/,'').to_i
            p_temp[:budget_margin] = project_hash["de budget margin"].gsub!(/,/,'').to_i
            
            found_project = Project.find_by(:project_name => p_temp[:project_name])
            found_client = Client.find_by(:client_name => p_temp[:client])
            
            if (found_project)
                found_project.update_attributes(p_temp)
            elsif (found_client)
                Project.create!(p_temp)
            else
                Project.create!(p_temp)
                Client.create!(client_name: p_temp[:client])

                # unless Client.where(:client_name == p_temp[:client]).count > 0
                #        Client.create!(client_name: p_temp[:client], company: "test")
                #   end
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

end
