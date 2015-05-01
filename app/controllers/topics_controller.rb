class TopicsController < ApplicationController
	before_action :find_topic, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user! , only: [:new, :edit, :create]

	def index
		@topics = Topic.all.order("created_at DESC")
	end

	def show
	end

	def new
		if current_user.admin
			@topic = current_user.topics.build
		else
			redirect_to root_path
		end
	end

	def create
		if current_user.admin
			@topic = current_user.topics.build(topic_params)
			if @topic.save
				redirect_to @topic
			else
				render new
			end
		else
			redirect_to root_path	
		end
	end

	def edit
	end

	def update
		if current_user.admin
			if @topic.update(topic_params)
				redirect_to @topic
			else
				render edit
			end
		else
			redirect_to root_path
		end

	end

	def destroy
		if current_user.admin
			@topic.destroy
			redirect_to root_path
		else
			redirect_to root_path
		end

	end

protected

	def find_topic
		@topic = Topic.find(params[:id])
	end

	def topic_params
		params.require(:topic).permit(:title, :content)
	end
end
