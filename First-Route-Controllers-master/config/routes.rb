Users::Application.routes.draw do

  resources :users, only [:index, :show, :create, :update, :destroy]

end
