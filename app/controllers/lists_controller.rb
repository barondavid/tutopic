class ListsController < ApplicationController
  before_action :authenticate_user!
  def index
  	if curren_user.admin
  		@users = User.all
  	end
  end
end
