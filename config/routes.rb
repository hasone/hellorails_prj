Rails.application.routes.draw do
  get 'store/index'

  get 'say/hello'

  get 'say/goodby'

  resources :products

  get 'store/index'


  # For details on the DSL available within this file, see
  # http://guides.rubyonrails.org/routing.html
  root 'store#index', as: 'store'

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

end
