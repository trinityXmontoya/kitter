Kitter::Application.routes.draw do

  # HOME PAGE
  root 'main#join'
  get '/#' => 'main#welcome'

  # FAQ
  get '/faq' => 'main#faq'

  # URL SHORTENER
  get '/s/*path' => 'short_links#redirect'

  # SESSIONS & SIGNUP
  get '/validate_input/*type' => 'sessions#validate_input'
  post '/login/request_token' => 'sessions#request_token', as: :request_token
  get '/login/:user_id/*auth_token' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # USERS
  get '/signup' => 'users#signup'

  resources :users, except:[:new] do
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

  # HASHTAGS
  get '/hashtags/:hashtag' => 'hashtags#show', as: :hashtag
  get '/discover' => 'hashtags#index', as: :hashtag_discover

end
