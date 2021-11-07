Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :surveys, only: [:show] do
    collection do
      post '/:id', to: 'surveys#create'
    end
  end
end
