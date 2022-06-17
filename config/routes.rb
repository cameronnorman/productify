# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products, param: :id do
        member do
          put '/assign_product_details', to: 'products#assign_product_details'
        end
      end

      resources :companies
    end
  end
end
