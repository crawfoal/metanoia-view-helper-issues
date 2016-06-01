Rails.application.routes.draw do
  root 'home#show'

  devise_for :users, skip: :registrations
  devise_scope :user do
    resource :registration,
             only: [:new, :create, :edit, :update],
             path: 'users',
             path_names: { new: 'sign_up' },
             controller: 'users/registrations',
             as: :user_registration do
               get :cancel
             end
  end

  namespace :users do
    resource :current_role, only: :update
  end

  namespace :athletes do
    resources :climb_logs, only: [:create, :index]
  end

  resources :gyms, except: :destroy
  resources :sections, only: [:new, :show] do
    resources :climbs, only: [:new, :create]
  end

  resource :profile, only: [:show], controller: :profile
end
