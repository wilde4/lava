Lava::Engine.routes.draw do
  resources :elements, :only => [:show]
end