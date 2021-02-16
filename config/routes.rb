Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/mail'
  end

  devise_for :users

  resources 'tweets'
  scope ":screen_name" do
    get '' => 'users#show'
    get 'following' => 'users#following'
    get 'followers' => 'users#followers'
  end
  resources 'follows', only: %i[create destroy]

  root 'home#index'
end
