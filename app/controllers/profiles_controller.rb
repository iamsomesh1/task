class ProfilesController < ApplicationController

	def show
		@profile = current_user.profile
	end

	def new
		if current_user.profile
			redirect_to articles_path
		else
		@profile = Profile.new
  end
end

  def create
    @profile = Profile.new(profile_params.merge(user_id: current_user.id))
    @profile.save
    redirect_to articles_path
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
  	@profile = Profile.find(params[:id])
    if @profile.update(profile_params)
     redirect_to root_path
    else
      render :edit
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:name, :dob, :address, :image)
    end
end
