Mylab::Application.routes.draw do
  get 'item_utensils/new'

  get 'item_utensils/show'

  get 'item_utensils/create'

  get 'item_utensils/edit'

  get 'item_utensils/update'

  get 'item_utensils/destroy'

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
end
