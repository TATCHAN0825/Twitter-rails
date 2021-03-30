Rails.application.routes.draw do
  get 'page/index'
  get 'notifications/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/mail'
  end

  devise_for :users
  get 'notifications' => 'notifications#index'
  resources 'tweets' do
    member do
      get 'retweet' => 'tweets#retweet'
    end
  end
  resources 'follows', only: %i[create destroy]
  get 'home' => 'timeline#home'
  get 'users' => 'users#index'
  resources 'likes', only: %i[create destroy]
  scope ':screen_name', as: 'user' do
    get '' => 'users#show'
    get 'following' => 'users#following'
    get 'followers' => 'users#followers'
  end

  root 'home#index'
end
