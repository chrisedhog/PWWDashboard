class SearchesController < ApplicationController

    def new
        @search = Search.new
        @project = []
        @client = []
        
        Client.all.each do |c|
            @client << c.client_name
        end

        Project.all.each do |p|
            @project << p.project_name
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
        params.require(:search).permit(:project, :clients, :from_date, :to_date)
    end

end