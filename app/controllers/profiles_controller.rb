class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  skip_before_action :profile_set, only: [:new, :create]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
    authorize! :read, @profile
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    authorize! :read, @profile
    @clients = Client.order(client_name: :ASC)
  end

  # GET /profiles/new
  def new
    if current_user.profile
      redirect_to :back, alert: 'You cannot have more than one profile. Please edit your profile through the user menu.'
    else
      @profile = Profile.new
      @clients = Client.all    
      end
  end

  # GET /profiles/1/edit
  def edit
    authorize! :edit, @profile
    @clients = Client.all    
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    authorize! :delete, @profile

    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
  
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :company_name, :country, :city, :direct_number, :position, :user_id, user_attributes: [:clients])
    end

end
