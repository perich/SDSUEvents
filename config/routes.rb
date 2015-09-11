Rails.application.routes.draw do
  devise_for :users

  resources :events do
  	member do
  		put :going, to:'events#upvote'
  		put :idc, to:'events#downvote'
  	end
  end

  root 'events#index'

  get '/topevents', to: 'pages#topevents', as: 'topevents'
  get '/randomevents', to: 'pages#randomevents', as: 'randomevents'
end
