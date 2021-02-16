Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/mail"
  end
end
