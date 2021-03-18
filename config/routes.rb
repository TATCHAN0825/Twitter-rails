Rails.application.routes.draw do
  get 'notifications/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/mail'
  end

  devise_for :users
  get 'tuuti' => 'notifications#index'
  resources 'tweets'
  resources 'follows', only: %i[create destroy]
  get 'home' => 'timeline#home'
  scope ':screen_name' do
    get '' => 'users#show'
    get 'following' => 'users#following'
    get 'followers' => 'users#followers'
  end

  root 'home#index'
end
