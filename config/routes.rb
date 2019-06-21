# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts do
    get :comments, on: :member
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:show]
    end
  end

  resources :users

  root to: "posts#index"
end
