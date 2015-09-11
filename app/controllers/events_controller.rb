class EventsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :upvote, :downvote]

	def index
		@events = Event.all.order(id: :desc).page(params[:page]).per(10)
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		@event.user = current_user
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

	def upvote
		@event = Event.find(params[:id])
		@event.upvote_by(current_user)
			redirect_to :back
	end

	def downvote
		@event = Event.find(params[:id])
		@event.downvote_by(current_user)
			redirect_to :back
	end

	private

		def event_params
			params.require(:event).permit(:body)
		end

end