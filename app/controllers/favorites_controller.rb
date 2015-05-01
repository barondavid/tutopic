class FavoritesController < ApplicationController
	before_action :authenticate_user!

	


	def index	
		
		@favorites = Favorite.where("user_id = #{current_user.id}")
		
		#"SELECT * FROM favorites WHERE user_id = #{current_user.id}" primera consuta
		#@favorites.count.times do 
  		#	@favorites << Favorite.find_by_sql("SELECT * FROM photos WHERE photo_id = #{@photos.photo_id}")
  		
  		#end

	end

	def update
  		@topic = Topic.find(params[:id])

  		#current_user.favorited_topics << @topic

  		#redirect_to @topic, notice: "topic favorited" 

  		type = params[:type]
		if type == "favorite"
			current_user.favorited_topics << @topic
			redirect_to @topic, notice: "Agregado a Favorito"
		elsif type == "unfavorite"
			current_user.favorited_topics.delete(@topic)
			redirect_to :back, notice: 'Eliminado de Favoritos'
		end




  	end






  	private
end
