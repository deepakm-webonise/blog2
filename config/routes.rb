Rails.application.routes.draw do
  resources :articles, path: '', except: [:show]

  match '/:id(/:slug)' => 'articles#show', via: [:get]
  root to: 'articles#index'
end
