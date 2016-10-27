class SearchesController < ApplicationController

    def new
        @search = Search.new
        @client = []
        @project = Project.all
        @location = ProjectLocation.all

        current_user.clients.order(client_name: :ASC).all.each do |myclient|
            @client << Client.find(myclient.id)
        end

    end

    def create
        clients = search_params[:client]
        locations = search_params[:location]

        search_params.delete("client")
        search_params.delete("location")
        @search = Search.create(search_params)

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
        @user_clients = []

        # keeping track of all user clients like this until I figure out how to bring in current user in model
        current_user.clients.all.each do |clientid|
            @user_clients << clientid.id
        end

#       NEW SEARCH FORM
        @search = Search.new
        @project = []
        @client = []
        @location = ProjectLocation.all

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
        params.require(:search).permit(:from_date, :to_date, location: [], client: [])
    end

end