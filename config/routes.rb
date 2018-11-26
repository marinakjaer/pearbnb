Rails.application.routes.draw do
  get 'bookings/create'
  get 'bookings/new'
  get 'bookings/destroy'
  get 'users/create'
  get 'users/new'
  get 'users/edit'
  get 'users/show'
  get 'users/update'
  get 'users/destroy'
  get 'flats/create'
  get 'flats/new'
  get 'flats/edit'
  get 'flats/show'
  get 'flats/update'
  get 'flats/destroy'
  get 'flats/results'
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flats, except: [:index]
  get 'flats/results', to: 'flats#results'
  resources :users, except: [:index]
  resources :bookings, except: [:index, :show, :update, :edit]


end
