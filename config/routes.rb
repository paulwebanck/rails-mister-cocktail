Rails.application.routes.draw do
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:create, :new]
  end
    resources :doses, only: [:destroy]
  root to: 'cocktails#index'
end

  # get 'doses/new'

  # get 'doses/destroy'

  # get 'cocktails/index'

  # get 'cocktails/show'

  # get 'cocktails/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

