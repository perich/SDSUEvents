class EventsController < ApplicationController

	def index

	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			redirect_to @event
		else
			flash[:danger] = @event.errors.full_messages.to_sentence
			render :new
		end
	end

	def show
		@event = Event.find(params[:id])
	end

	private

		def event_params
			params.require(:event).permit(:body)
		end

end