Rails.application.routes.draw do
  devise_for :users

  root to: 'admin/products#index'

  scope  :module => "admin", :as => 'admin', :path => 'fiddle' do
    resources :catalog, only: [:new, :create]
    resources :products, only: :index
  end
end
