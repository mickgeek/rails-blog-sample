Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users, skip: [:sessions, :passwords]
  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new', as: :new_user_session
    post 'sign_in', to: 'users/sessions#create', as: :user_session
    match 'sign_out', to: 'users/sessions#destroy',
      via: Devise.mappings[:user].sign_out_via, as: :destroy_user_session

    get 'restore', to: 'users/passwords#new', as: :new_user_password
    get 'restore/confirm', to: 'users/passwords#edit', as: :edit_user_password
    resource 'restore', only: [:create, :update], controller: 'users/passwords', as: :user_password
  end

  namespace :admin do
    resources :users, :posts, :tags, :pages, except: :show

    root to: 'dashboard#index'
  end

  get 'blog/tags/:tag', to: 'posts#list_by_tag', as: :posts_by_tag
  resources :posts, only: [:index, :show], path: 'blog' do
    get 'archive', to: 'posts#archive', on: :collection
  end

  resource :feedback, only: [:new, :create], path_names: { new: '' }, path: 'feedback'
  get ':url', to: 'pages#show', url: /.+/, format: false, as: :page

  root to: 'site#index'
end
