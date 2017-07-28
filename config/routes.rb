Rails.application.routes.draw do

	resources :users, only: [:show, :new, :index, :create, :edit, :update]
	resources :attractions, only: [:show, :new, :index, :create, :edit, :update]
	resources :sessions, only: [:new, :create, :destroy, :show]

	get '/', to: 'welcomes#show', as: 'home'
	get '/signin', to: 'sessions#new'
	post '/signin', to: 'sessions#create'
	post '/rides', to: 'rides#create'



end