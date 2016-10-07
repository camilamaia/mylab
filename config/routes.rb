Mylab::Application.routes.draw do
  devise_for :users
  resources :stocks

  resources :materials
  resources :utensils

  resources :items
  resources :item_utensils

  root 'home#index', :as => :home
  get 'generate_xls', to: "home#generate_xls"

  resources :laboratories do
    post 'update_current_lab', on: :member
  end

  resources :locales do
    get :select, on: :member
  end
end
