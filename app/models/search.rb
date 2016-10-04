class Search < ActiveRecord::Base
has_many :search_clients
has_many :clients, through: :search_clients

has_many :search_all_projects
has_many :projects, through: :search_all_projects

validates_date :to_date, :on_or_after => :from_date, :on_or_after_message => "From date cannot be after To date"
validates_date :from_date, :on_or_before => :today

    def search_projects(id)

        # The ID is coming through correctly. Just need to correctly sort through the data based off the client and proejct join tables

        projects = []
        search = Search.find(id)

        search.clients.each do |c|
            puts c.client_name.to_s
        end

        return projects
    end

    def current_datab
        current_data = Project.where(id: @found_search.projects.pluck(:id)).group_by_month(:created_at).sum(:budget_margin)

        return current_data
    end

    def budget_margin_by_month
        my_projects = Project.where(id: projects.pluck(:id))
        my_projects = my_projects.where("project_status = ?", "Contracted") 
        my_projects = my_projects.where("created_at >= ? AND created_at <= ?", from_date, to_date) 
        my_projects_sorted = my_projects.group_by_month(:created_at).sum(:budget_margin) 
        
        return my_projects_sorted
    end


    def self.past_sample_data
        { "2015-01-01" => 3256870.00.to_d,
          "2015-02-01" => 3825580.00.to_d,
          "2015-03-01" => 4394290.00.to_d,
          "2015-04-01" => 5550000.00.to_d,
          "2015-05-01" => 6044000.00.to_d,
          "2015-06-01" => 7100000.00.to_d,
          "2015-07-01" => 7700000.00.to_d,
          "2015-08-01" => 8154000.00.to_d,
          "2015-09-01" => 8860000.00.to_d,
          "2015-10-01" => 9200000.00.to_d,
          "2015-11-01" => 9500000.00.to_d,
          "2015-12-01" => 9600328.45.to_d }
    end

# TRYING TO TURN THE BELOW INTO A HASH, I can then group the data bay the searched dates so that it's serving up the correct data to the correct month
    def self.past_sample_data2
        date1 = {:record_date => "2015-01-01", :budget_margin => 3256870.00.to_d}
        date2 = {:record_date => "2015-02-01", :budget_margin => 3825580.00.to_d}
        date3 = {:record_date => "2015-03-01", :budget_margin => 4394290.00.to_d}
        date4 = {:record_date => "2015-04-01", :budget_margin => 5550000.00.to_d}
        date5 = {:record_date => "2015-05-01", :budget_margin => 6044000.00.to_d}
        date6 = {:record_date => "2015-06-01", :budget_margin => 7100000.00.to_d}
        date7 = {:record_date => "2015-07-01", :budget_margin => 7700000.00.to_d}
        date8 = {:record_date => "2015-08-01", :budget_margin => 8154000.00.to_d}
        date9 = {:record_date => "2015-09-01", :budget_margin => 8860000.00.to_d}
        date10 = {:record_date => "2015-10-01", :budget_margin => 9200000.00.to_d}
        date11 = {:record_date => "2015-11-01", :budget_margin => 9500000.00.to_d}
        date12 = {:record_date => "2015-12-01", :budget_margin => 9600328.45.to_d}
        data_last_year = [date1, date2, date3, date4, date5, date6, date7, date8, date9, date10, date11, date12]

        return data_last_year
    end

    def self.get_budget_margin_histdata_by_search_date(dataset, date_from, date_to)
        dataset.find_all do |dat|
            dat[:record_date].to_time.find("record_date >= ? AND record_date <= ?", from_date, to_date) 
        end
        return temp_records
    end

    def self.forecast_sample_data
        { "2016-01-01" => 3916752.11.to_d,
          "2016-02-01" => 4626643.23.to_d,
          "2016-03-01" => 5146264.25.to_d,
          "2016-04-01" => 6148854.32.to_d,
          "2016-05-01" => 6640724.57.to_d,
          "2016-06-01" => 7409783.48.to_d,
          "2016-07-01" => 8263054.46.to_d,
          "2016-08-01" => 8488001.54.to_d,
          "2016-09-01" => 8837809.10.to_d,
          "2016-10-01" => 9068047.68.to_d,
          "2016-11-01" => 9402019.15.to_d,
          "2016-12-01" => 9513505.72.to_d } 
    end
end
