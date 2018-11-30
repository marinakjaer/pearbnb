Rails.application.routes.draw do

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'flats/results', to: 'flats#results'
  resources :flats, except: [:index] do
    resources :bookings, except: [:index, :show, :update, :edit]
  end
  # resources :users, except: [:index]

  devise_for :users
  get 'users/:id', to: 'users#profile', as: :profile
  get 'users/:id/flats', to: 'users#flats', as: :host_flats

end
