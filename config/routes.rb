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

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/faq' => 'main#faq'

  resources :users, only:[:show,:create,:edit,:update,:destroy] do
    get '/favorites' => 'users#favorites'
    get '/followers' => 'users#followers'
    get '/following' => 'users#following'
    get '/notifications' => 'users#notifications'
    post '/follow' => 'users#follow'
    post '/unfollow' => 'users#unfollow'
    post '/block' => 'users#block'
    post '/unblock' => 'users#unblock'
    post 'check_email' => 'users#check_email'
    resources :tweets, shallow: true do
       post '/favorite' => 'tweets#favorite'
       post '/unfavorite' => 'tweets#unfavorite'
       post '/retweet' => 'tweets#retweet'
       post '/reply' => 'tweets#reply'
    end
  end

  get '/signup' => 'users#signup'

  get '/hashtags/:hashtag' => 'hashtags#show', as: :hashtag
  get '/hashtags' => 'hashtags#index'

end
