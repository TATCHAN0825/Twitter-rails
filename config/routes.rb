Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  resources 'tweets'
  get ':screen_name' => 'users#show'

  root 'home#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/mail"
  end
end
