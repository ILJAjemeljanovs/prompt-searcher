Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "prompts#index"
  resources :prompts, only: :index do
    collection do
      get :random_prompt
      post :search_prompt
    end
  end
end
