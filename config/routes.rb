ProjectMusic::Application.routes.draw do
  root :to => "home#index"

resources :users, :only => [:index, :new, :create]
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :musics do
    member do
      get :bio
      get :showhot
      get :artist_img
      get :artist_event
    end
  end


  #do
    # collection do
    #   get "counter"
    # end
  #end



end
