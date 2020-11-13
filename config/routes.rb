Rails.application.routes.draw do
  resource :wombats, only: [:index, :destroy]
  get 'wombats/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'wombats#index'
end
