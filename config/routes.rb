Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope :api do 
    resources :courses
    resources :sessions, only: :create
    resources :users do 
      resources :favourites, only: [:create, :destroy, :index]
    end
  end
  # Ex:- scope :active, -> {where(:active => true)}
end
