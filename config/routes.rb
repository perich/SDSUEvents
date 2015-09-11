Rails.application.routes.draw do
  devise_for :users

  resources :events do
  	member do
  		put :going, to:'events#upvote'
  		put :idc, to:'events#downvote'
  	end
  end

  root 'events#index'
end
