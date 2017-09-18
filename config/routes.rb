Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  # devise_for :users
  root :to => "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    # resources :goals
    resources :logs
  end

end
