Rails.application.routes.draw do

  devise_for :admins, skip: [:registrations], controllers: {
    #これらを書かないとログイン時に呼び出されるアクションがuserのroutingと一致してしまう。
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
  }

  authenticated :user do
    devise_scope :admin do
      get 'admins/sign_up' => 'devise/registrations#new', as: :new_admin_registration
      post 'admins/sign_up' => 'devise/registrations#create', as: :admin_registration
    end
  end

  devise_for :users, skip: [:registrations], controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
  }

  resources :users
  root"posts#index"
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

