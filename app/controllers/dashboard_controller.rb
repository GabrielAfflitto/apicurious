class DashboardController < ApplicationController

  def index
    @user = GithubUser.new(current_user)
    @user.get_profile_info
  end

end
