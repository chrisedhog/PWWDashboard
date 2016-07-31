class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @clients = Client.all
    # all projects belonging to a user:
    @myprojects = []
    @myclients = []
    current_user.clients.all.each do |myclient|
            @myclients << myclient.client_name
    end

    @myproject2 = Project.where(client: @myclients)


    # current_user.clients.all.each do |myclient|
    #         @myproject2 << Project.find_by(client: myclient.client_name)
    # end

    # Project.all.each do |project|
    #   @myproject2 << Project.find_by(client: myclient.client_name)
    # end

    if (current_user.clients.count > 0)
      Project.all.each do |proj|
      i = 0
        while (i < current_user.clients.count)
        # THIS PART I'M STRUGGELING WITH - seems to be working now. I loop through my current_user's clients using i,
        # and if they are the same as in the DB, it will add them to @myprojects. If it isn't, it will skip and just 
        # increment i by 1.

        #I THINK THIS CAN BE SIMPLIFIED A LOT BY JUST HAVING @MYPROJECTS = Project.find_by("MY CLIENTS")!!!!
              if (proj.client == @clients.find(current_user.clients[i].id).client_name)
                @myprojects << proj
                  i = i + 1
                  else
                  i = i + 1
                end
            end
          end
      else
        @myprojects = Project.all
      end
      
    end

  # GET /projects/1
  # GET /projects/1.json
  def show
    
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_all
        Project.all.each do |project|
            project.delete
        end
        redirect_to :back
  end
  
  def import
    Project.import(params[:file])
    redirect_to :back, notice: "Success!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:project, :project_status, :project_status, :project_name, :completion_date, :completion_month, :budget_revenue, :budget_margin, :budget_margin)
    end

end
