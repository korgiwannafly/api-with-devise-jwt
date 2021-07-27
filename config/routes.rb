Rails.application.routes.draw do
  scope :api, module: :api, defaults: { format: :json } do 
    scope :v1, module: :v1 do 

      root to: "home#index"
      resources :home, only: :index

      scope :users, module: :users do 
        devise_for :users, path: '',
        path_names: {
          sign_in:       'sign_in', 
          sign_out:      'sign_out',
          sign_up:       'sign_up',
          password:      'secret', 
          confirmation:  'verification'
        },
        controllers: {
          sessions:      'api/v1/users/sessions',
          passwords:     'api/v1/users/passwords',
          registrations: 'api/v1/users/registrations',
          confirmations: 'api/v1/users/confirmations'
        }
      end
    end
  end
end
