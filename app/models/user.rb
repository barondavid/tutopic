class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
        has_many :topics
        has_many :comments
		
	     	has_many :favorites
       	has_many :favorited_topics, through: :favorites, source: :topic 

        has_many :reports
        has_many :reported_comments, through: :reports, source: :comment

        def already_favorited?(topic)
        	favorited_topics.where(id: topic.id).count > 0
        end

        def already_reported?(comment)
          reported_comments.where(id: comment.id).count > 0
        end
end
