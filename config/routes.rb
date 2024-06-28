Rails.application.routes.draw do
  resources :itempedidos
  resources :produtos
  resources :pedidos

  
  resources :posts

  #para negar o registration sem ser pelo modelo
  devise_for :users, controllers: {
    sessions: 'users/sessions',
  }, skip: [:registrations]
  
  authenticated :user do 

    #apenas quem esta logado pode cadastrar um novo usuario, skipando sessions para evitar erro
    devise_for :users, controllers: {
      registrations: 'users/registrations'
    }, skip: [:sessions]


    root to: "pedidos#index", as: :user_root

  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
#   root "home#index"
   root "pedidos#index"

end
