class EventsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :upvote, :downvote, :edit, :update, :destroy]

	def index
		@events = Event.all.order(id: :desc).page(params[:page]).per(10)
	end

	def show
		@event = Event.find(params[:id])
		@comments = Comment.where(event_id: @event)
	end

	def new
		@event = current_user.events.build
	end

	def edit
		@event = Event.find(params[:id])
	end

	

	def create
		@event = current_user.events.build(event_params)
		if @event.save
			redirect_to @event
		else
			flash[:danger] = @event.errors.full_messages.to_sentence
			render :new
		end
	end

	def update
		@event = Event.find(params[:id])
	    if @event.update(event_params)
	      redirect_to @event, notice: 'Event was successfully updated.'
	    else
	      render action: 'edit'
	  end
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to events_url
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

	def search
		if params[:search].blank?
			@events = Event.all
		else
			@events = Event.search(params)
		end
	end

	private

		def set_event
      		@event = Event.find(params[:id])
    	end

		def event_params
			params.require(:event).permit(:title, :body, :image, :category_id)
		end


end