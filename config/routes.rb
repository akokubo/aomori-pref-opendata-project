Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get 'about' => 'home#about'
  get 'map'   => "map#index", as: :map

  resources :places
  resource :initial, only: [:show, :edit, :update, :destroy]

  resources :sessions, only: [:create, :destroy]
  match '/signout', to: 'sessions#destroy', via: 'delete'
end
