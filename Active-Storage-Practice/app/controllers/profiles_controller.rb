class ProfilesController < ApplicationController

  def index
    render json: Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
    render json: @profile
  end

  def create
    prof_create = Profile.new(prof_params)
    if prof_create.save
        render json: {message: "Profile Created Successfully", profile: prof_create}
    else
        render json: {error: "Something went wrong!!!"}
    end
  end

  def update
    profile = Profile.find(params[:id])
    prof_update= profile.update(prof_params)
    render json: {message: "Profile Updated Successfully", profile: prof_update}
  end

  private
  def prof_params
    params.permit(:name, :email, :image)
  end
end
