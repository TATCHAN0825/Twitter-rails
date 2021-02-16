Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/mail'
  end

  devise_for :users

  resources 'tweets'
  get ':screen_name' => 'users#show'
  resources 'follows', only: %i[create destroy]

  root 'home#index'
end
