Lava::Engine.routes.draw do

  resources :elements
  
  root :to => "pages#index"
end