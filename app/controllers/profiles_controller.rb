class ProfilesController < ApplicationController
  load_and_authorize_resource
  before_filter :check_if_signed_in

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile

    if @profile.update_attributes(params[:profile])
      flash[:success] = "Profile updated successfully"
    else
      flash[:fail] = "Could not update profile information"
    end
    render 'edit'
  end

  private
    def check_if_signed_in
      if !user_signed_in?
        redirect_to root_url, :alert => 'Please log in.'
      end
    end
end
