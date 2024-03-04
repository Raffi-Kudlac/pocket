Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      post '/upload', to: "main#upload"
      get '/getTag', to: "main#get_tag"
      get '/getPngUrl', to: "main#get_png_url"
    end
  end
end
