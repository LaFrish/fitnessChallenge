Rails.application.routes.draw do
  root :to => "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    # resources :goals
    resources :logs
  end

end
