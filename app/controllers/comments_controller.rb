class CommentsController < ApplicationController
	before_action :get_current_topic
	before_action :authenticate_user!

	def create
		@comment = @topic.comments.create(comment_params)
		@comment.user = current_user
		if @comment.save
			redirect_to @topic
		else
			render new
		end
	end
protected

	def get_current_topic
		@topic = Topic.find(params[:topic_id])
	end

	def comment_params
		params.require(:comment).permit(:body)
	end	

end
