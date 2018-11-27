Rails.application.routes.draw do

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'flats/results', to: 'flats#results'
  resources :flats, except: [:index]
  # resources :users, except: [:index]
  resources :bookings, except: [:index, :show, :update, :edit]
  devise_for :users


end
