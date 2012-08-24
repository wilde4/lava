Rails.application.routes.draw do
  resources :elements
  mount Lava::Engine => "/", :as => "l" # need :as for namespacing
  root :to => "pages#index"
end