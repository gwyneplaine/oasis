# == Route Map
#
# You don't have any routes defined!
#
# Please add some routes in config/routes.rb.
#
# For more information about routes, see the Rails guide: http://guides.rubyonrails.org/routing.html.
#

Rails.application.routes.draw do

  root :to => 'events#index'
  resources :timelines
  resources :users, :except => [:edit, :show] do 
    collection do 
      get '/edit' => 'users#edit'
    end
  end
  resources :events
  resources :categories
  resources :locations

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
