class SearchesController < ApplicationController

    def new
        @search = Search.new
        @client = []
        @project = []

        current_user.clients.order(client_name: :ASC).all.each do |myclient|
            @client << Client.find(myclient)
        end

        @client.each do |client|
            client.projects.each do |myprojects|
                @project << myprojects
            end
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

        @client.each do |client|
            client.projects.each do |myprojects|
                @project << myprojects
            end
        end
    end

    private

    def search_params
        params.require(:search).permit(:project, :client, :from_date, :to_date)
    end

end