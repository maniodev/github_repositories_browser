Rails.application.routes.draw do
  resources :github_repositories, only: [:index]
  root "github_repositories#index"
end
