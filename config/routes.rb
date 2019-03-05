Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :heroes, only: %i[index show]
      resources :abilities, only: %i[index show]
    end
  end
end
