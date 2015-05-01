class ListsController < ApplicationController
  before_action :authenticate_user!
  def index
  	if user_signed_in?
  		if current_user.admin
  			@users = User.all
  		end
  	else
  		redirect_to root_path
  	end
  end
end
