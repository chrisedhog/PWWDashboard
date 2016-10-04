class SearchesController < ApplicationController

    def new
        @search = Search.new
        @client = []
        @project = []

        current_user.clients.order(client_name: :ASC).all.each do |myclient|
            @client << Client.find(myclient)
        end

        @client.each do |client|
            client.projects.select(:project_name).distinct do |myprojects|
                @project << myprojects
            end
        end

    end

    def create
        clients = search_params[:client]
        projects = search_params[:project]

        clients = current_user.clients.all.pluck(:id) if clients.size == 1
        projects = current_user.client_projects if projects.size == 1

        search_params.delete("client")
        search_params.delete("project")
        @search = Search.create(search_params)

        clients.each do |c|
            temp_client = Client.find_by_id(c)
            @search.clients << temp_client unless temp_client.nil?
        end
        projects.each do |p|
            temp_proj = Project.find_by_id(p)
            @search.projects << temp_proj unless temp_proj.nil?
        end

        respond_to do |format|
            if @search.save
                format.html { redirect_to @search }
                format.json { render :show, status: :created, location: @search }
            else
            puts @search.errors
                format.html { render :new, errors: @search.errors }
                format.json { render json: @search.errors, status: :unprocessable_entity }
            end
        end
    end

    def show
        @found_search = Search.find(params[:id])
        @year_comparison = Search.find(params[:id]).projects.group_by_month(:created_at)

#       NEW SEARCH FORM
        @search = Search.new
        @project = []
        @client = []

        current_user.clients.order(client_name: :ASC).all.each do |myclient|
            @client << Client.find(myclient)
        end

        @client.each do |client|
            client.projects.each do |myprojects|
                @project << myprojects
            end
        end
    end
#   END NEW SEARCH FORM

    private

    def search_params
        params.require(:search).permit(:from_date, :to_date, project: [], client: [])
    end

end