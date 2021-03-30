Rails.application.routes.draw do
  namespace 'api' do
    resources 'tweets', only: %i[index]
  end

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
  get 'vue' => 'vue#index'
  resources 'likes', only: %i[create destroy]
  scope ':screen_name', as: 'user' do
    get '' => 'users#show'
    get 'following' => 'users#following'
    get 'followers' => 'users#followers'
  end

  root 'home#index'
end
