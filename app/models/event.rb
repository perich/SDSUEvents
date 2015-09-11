class Event < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :comments

	acts_as_votable

	def self.popular
		order(cached_votes_score: :desc).limit(10)
	end

	def self.random
		limit(10).order("RANDOM()")
	end
end