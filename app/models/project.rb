class Project < ActiveRecord::Base
require 'csv'
belongs_to :client

has_many :search_all_projects
has_many :searches, through: :search_all_projects, dependent: :destroy

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            
            project_hash = row.to_hash
            project = Project.where(id: project_hash["id"])
            
            project_hash.map do |key, value|
                puts key.to_s
                puts value.to_s
            end
            
            p_temp = {}
            client_temp = {}
            client_temp[:client] = project_hash["client"]
            p_temp[:project_status] = project_hash["pipeline stage"]
            p_temp[:project_name] = project_hash["project no/name"]
            p_temp[:completion_date] = project_hash["completion date"]
            p_temp[:completion_month] = project_hash["completion date month/year"]
            p_temp[:budget_revenue] = project_hash["projected revenue"].gsub!(/,/,'').to_f if project_hash["projected revenue"]
            p_temp[:budget_margin] = project_hash["projected margin (ext wtime)"].gsub!(/,/,'').to_f if project_hash["projected margin (ext wtime)"]
            p_temp[:created_at] = DateTime.strptime(project_hash["Date created"], "%d/%m/%y").utc
            client_temp[:location] = project_hash["location"] if project_hash["location"]
            p_temp_month = project_hash["Month"]
            
            found_project = Project.order('created_at DESC').find_by(:project_name => p_temp[:project_name])
            found_loc = ProjectLocation.find_by(:location => client_temp[:location]) || ProjectLocation.create!(:location => client_temp[:location])
            found_client = Client.find_by(:client_name => client_temp[:client], :location => client_temp[:location]) || Client.create!(:client_name => client_temp[:client], :location => client_temp[:location])
            # found_client = Client.find_by(:client_name => p_temp[:client]) || Client.create!(:client_name => p_temp[:client])

            if (found_project) && (found_client)
                if (found_project.created_at.month == Time.zone.now.month )
                    found_project.update_attributes(p_temp)
                else
                    Project.create!(p_temp)
                    found_client.projects << Project.last
                end
            else
                Project.create!(p_temp)
                found_client.projects << Project.last
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
