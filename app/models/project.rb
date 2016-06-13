class Project < ActiveRecord::Base
require 'csv'
    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Project.create! row.to_hash
        end
    end
    
    # def self.import(file)
    #     CSV.foreach(file.path, headers: true) do |row|
            
    #         client_hash = row.to_hash
    #         client = Client.where(id: client_hash["id"])
            
    #         if client.count == 1
    #             client.first.update_attributes(client_hash)
    #         else
    #             Client.create!(client_hash)
    #         end
    #     end
    # end
end
