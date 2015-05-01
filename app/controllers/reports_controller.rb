class ReportsController < ApplicationController

 before_action :authenticate_user!

	  def show
        @comment = Report.where("#[current_user.id]")
    end
        
    def update
        @comment = Comment.find(params[:id])
          type = params[:type]
          if type == "report"
            current_user.reported_comments << @comment
            redirect_to :back, notice: "comment reported!"
          elsif type == "unreport"
            current_user.reported_comments.delete(@comment)
            redirect_to :back, notice: 'comment Unreported'
        end
    end
end
