class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: [:new, :show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /user_profile
  # GET /user_profile
  def show
    if !@user_profile
      redirect_to '/user_profile/new'
    end
  end

  alias_method :edit, :show

  # GET /user_profile/new
  def new
    redirect_to '/user_profile' if @user_profile
    @user_profile = UserProfile.new
  end

  # POST /user_profiles
  # POST /user_profiles.json
  def create
    @user_profile = UserProfile.new(user_profile_params)
    puts user_profile_params

    respond_to do |format|
      if current_user.user_profile = @user_profile
        format.html { redirect_to '/user_profile', notice: 'User profile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_profiles/1
  # PATCH/PUT /user_profiles/1.json
  def update
    respond_to do |format|
      if @user_profile.update(user_profile_params)
        format.html { redirect_to '/user_profile', notice: 'User profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_profiles/1
  # DELETE /user_profiles/1.json
  def destroy
    @user_profile.destroy
    respond_to do |format|
      format.html { redirect_to user_profiles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_profile
      @user = current_user
      @user_profile = @user.user_profile
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_profile_params
      params.require(:user_profile).permit(:gamertag, :photo)
    end
end
