ProjectMusic::Application.routes.draw do
  resources :homes


  resources :musics #do
    # collection do
    #   get "counter"
    # end
  #end
  post 'musics/counter/:id' => 'musics#counter'


end
