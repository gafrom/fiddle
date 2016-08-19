Rails.application.routes.draw do
  devise_for :users

  root to: 'products#index'

  scope  :module => "admin", :as => 'admin', :path => 'fiddle' do
    root to: 'catalog#new'
    resources :catalog, only: [:new, :create]
    resources :products, only: :index
  end
end
