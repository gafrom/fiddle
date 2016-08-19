Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'catalogs#show'

  resources :catalogs, only: :show

  scope  :module => "admin", :as => 'admin', :path => 'fiddle' do
    root to: 'catalogs#index'
    resources :catalogs
  end
end
