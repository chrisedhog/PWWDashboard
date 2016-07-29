class SearchProjectsController < ApplicationController
    def new 
        @search_project = SearchProject.new
    end

    def create
        @search_project = SearchProjects.create!(params[:search_project])
        redirect_to @search_project
    end

    def show
        @search_project = SearchProject(params[:id])
    end
end
