Rails.application.routes.draw do
  # Temporarily simplified for debugging
  devise_for :users
  root "dashboard#index"

  # All other routes are temporarily commented out.
  # -----------------------------------------------

  # resources :projects do
  #   resources :tasks, except: [:index] do
  #     member do
  #       patch :toggle_completion
  #       patch :move
  #     end
  #   end
  # end

  # get "up" => "rails/health#show", as: :rails_health_check

  # if Rails.env.development?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end
end