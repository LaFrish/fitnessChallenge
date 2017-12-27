Rails.application.routes.draw do


  # devise_for :users
    # devise_for :users, controllers: {
    #   sessions: 'users/sessions'
    # }
devise_for :users, controllers: {registrations: "users/registrations", sessions: 'users/sessions'}

  # devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}



root :to => "users#index"




    resources :users do
      # resources :goals
      # resources :logs do

      resources :foods
      resources :workouts
      resources :sleeps
      resources :waters
      resources :goals
      resources :logs
    # end
  end

end
