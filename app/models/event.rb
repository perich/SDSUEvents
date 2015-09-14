class Event < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :comments

	acts_as_votable

	has_attached_file :image, styles: {large: "600x600>", medium: "400x400>", thumb: "150x150#"}, default_url: "../images/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  	

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