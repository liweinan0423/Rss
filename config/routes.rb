Rss::Application.routes.draw do

  root :to => 'channels#index'
  
  resource :login, :controller => :login

  resources :channels do
    resources :posts
    resources :subscriptions
  end

end
