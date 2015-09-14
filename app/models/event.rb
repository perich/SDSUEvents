class Event < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :comments

	acts_as_votable

	def self.popular
		order(cached_votes_score: :desc).limit(50)
	end

	def self.random
		limit(50).order("RANDOM()")
	end

	def self.search(params)
		events = Event.where("body LIKE ?", "%#{params[:search]}%") if params[:search].present?
		events
	end

end