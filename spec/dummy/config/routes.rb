Rails.application.routes.draw do
  mount Lava::Engine => "/", :as => "lava" # need :as for namespacing

  root :to => "pages#index"
end