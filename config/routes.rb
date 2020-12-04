# frozen_string_literal: true

Rails.application.routes.draw do
  resources :accounts do
    resource :profiles, only: %i[show create update]
  end
end
