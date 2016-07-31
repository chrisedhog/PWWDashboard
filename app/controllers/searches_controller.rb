class SearchesController < ApplicationController

    def new
        @search = Search.new
        @project = []
        @client = []

        current_user.clients.all.each do |myclient|
            @client << myclient.client_name
        end

        @myproject = Project.where(client: @client)

        @myproject.all.each do |proj|
            @project << proj.project_name
        end

    end

    def create
        @search = Search.create(search_params)
        redirect_to @search
    end

    def show
        @search = Search.find(params[:id])
    end

    private

    def search_params
        params.require(:search).permit(:project, :client, :from_date, :to_date)
    end

end