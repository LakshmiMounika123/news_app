# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :catalogs  do# table name
    
  resources :articles do
    resources :comments
    resources :media
    resources :thumbnail
  end
  resources :polls
  resources :galleries

  end
  
end
