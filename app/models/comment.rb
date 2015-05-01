class Comment < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user

  has_many :reports #
  has_many :reporter, through: :reports, source: :user #
end
