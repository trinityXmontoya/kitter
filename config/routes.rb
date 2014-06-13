Kitter::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  root 'main#welcome'

  get '/validate_input/*type' => 'sessions#validate_input'

  get '/login' => 'sessions#new'
  post '/login/:user_id/send_login_link' => 'sessions#request_token', as: :request_token
  get '/login/:user_id/*auth_token' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  get '/faq' => 'main#faq'

  resources :users, only:[:index,:show,:create,:edit,:update,:destroy] do
    get '/favorites' => 'users#favorites'
    get '/followers' => 'users#followers'
    get '/following' => 'users#following'
    get '/notifications' => 'users#notifications'
    post '/follow' => 'users#follow'
    post '/unfollow' => 'users#unfollow'
    post '/block' => 'users#block'
    post '/unblock' => 'users#unblock'
    resources :tweets, shallow: true do
       post '/favorite' => 'tweets#favorite'
       post '/unfavorite' => 'tweets#unfavorite'
       post '/retweet' => 'tweets#retweet'
       post '/undo_retweet' => 'tweets#undo_retweet'
       post '/reply' => 'tweets#reply'
    end
  end

  get '/signup' => 'users#signup'

  get '/hashtags/:hashtag' => 'hashtags#show', as: :hashtag
  get '/discover' => 'hashtags#index', as: :hashtag_discover

end
