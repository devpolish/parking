# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :parking, only: %i[create update], param: :vehicle_identifier

      resources :owners, only: %i[create index], param: :document, path: :owners do
        resources :vehicles, only: %i[create show], controller: 'owners/vehicles'
        resources :checkout, only: :index, controller: 'owners/checkout'
      end

      namespace :parking do
        resources :vehicles, only: :index
      end
    end
  end
end
