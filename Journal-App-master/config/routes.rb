Rails.application.routes.draw do

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root 'root#root'
  resources :posts, defaults: {format: :json}

end
