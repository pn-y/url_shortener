Rails.application.routes.draw do
  root 'pages#home'

  get '/:id', to: 'links#show'

  namespace :api do
    namespace :v1 do
      resources :links, only: :create
    end
  end
end
