Rails.application.routes.draw do
  # resources :people
  get '/people', to: 'people#index'
  get '/people/:nationalId', to: 'people#show'
  delete '/people/:nationalId', to: 'people#destroy'
  put '/people/:nationalId', to: 'people#update'
  post '/people', to: 'people#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
