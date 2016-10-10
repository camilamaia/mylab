Mylab::Application.routes.draw do
  resources :item_standard_solutions
  resources :standard_solutions
  devise_for :users
  resources :stocks

  resources :materials
  resources :utensils
  resources :glasswares

  resources :items
  resources :item_utensils
  resources :item_glasswares

  root 'home#index', :as => :home
  get 'generate_xls', to: "home#generate_xls"

  resources :laboratories do
    post 'update_current_lab', on: :member
  end

  resources :locales do
    get :select, on: :member
  end
end
