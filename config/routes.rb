Rss::Application.routes.draw do

  root :to => 'channels#index'
  
  resource :login, :controller => :login

  resources :channels do
    resources :posts do
      match 'image' => 'posts#show_image'
    end
    resources :subscriptions
  end

end
