Rails.application.routes.draw do
  resources :pages do 
    member do
      get :new_photo
      post :upload_photo
      get :all_photos
      get :serve
    end
  end
  resource :sign_out, only: [:destroy]
  resource :sign_up, only: [:show, :create]
  resource :sign_in, only: [:show, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
