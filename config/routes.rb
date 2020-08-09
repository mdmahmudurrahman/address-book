Rails.application.routes.draw do
  root "static_pages#home"

  devise_for :users , controllers: { registrations: "registrations" }

  namespace :dashboard do
    resources :contact_addresses, only: %i(index new create)
  end
end
