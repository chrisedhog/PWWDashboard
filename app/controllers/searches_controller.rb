class SearchesController < ApplicationController

    def new
        @search = Search.new
        @client = []
        @project = [] 
        @temp = []

        current_user.clients.order(client_name: :ASC).all.each do |myclient|
            @client << Client.find(myclient)
        end

        @myproject = Project.where(client: @client)

        @client.each do |myprojects|
            # @project << Project.find_by_client(myprojects.client_name)
            @temp = Project.where(["client LIKE ?", "#{myprojects.client_name}"])
            @project << temp

        end

    end

    def create
        @search = Search.create(search_params)
        redirect_to @search
    end

    def show
        @search_results = Search.find(params[:id])
        @search = Search.new
        @project = []
        @client = []

        current_user.clients.order(client_name: :ASC).all.each do |myclient|
            @client << Client.find(myclient)
        end

        @myproject = Project.where(client: @client)
        @project = @myproject
        # @myproject.all.each do |proj|
        #     @project << proj.project_name
        # end
    end

    private

    def search_params
        params.require(:search).permit(:project, :client, :from_date, :to_date)
    end

end