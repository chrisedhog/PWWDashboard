class Search < ActiveRecord::Base

    def search_projects

        projects = Project.all

        projects = projects.where(["client LIKE ?", client]) if client.present? 

        unless project == 'All'
            projects = projects.where(["project_name LIKE ?", project])
        end
        # I was really struggling with the above, the first part "project_name LIKE ?" actually relates to the field in the Projects
        # database that you wish to compare the search field 'project' with. In this case I wanted to compare Project.project_name

        return projects
    end

end
