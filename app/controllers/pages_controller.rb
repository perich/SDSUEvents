class PagesController < ApplicationController
	def topevents
		@events = Event.popular
	end

	def randomevents
		@events = Event.random
	end
end