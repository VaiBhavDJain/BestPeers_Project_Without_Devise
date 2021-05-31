Rails.application.routes.draw do
  root to: redirect('/session/new')

  resources :users, only: %i[new create] do
    
    resources :employee do
      member do
        get :delete
      end
    end
    resources :admin do
      member do
        get :delete
      end
      get 'new_skills' => 'admin#new_skills', as: 'new_skills'
      post 'add_skill' => 'admin#add_skills', as: 'add_skills' 
    end

    resources :employee_skills do
      member do
        get :delete
      end
    end

    resources :chatting do
      member do
        get :delete
      end
    end
  end

  resource :session, only: %i[new create destroy]

  get 'home/:id' => 'users#home', as: 'home_page'
  get 'verification/:id' => 'users#verification_mail_send', as: 'verification_mail_send' 
  get 'verify/token=:token' => 'users#verify_mail', as: 'verify_mail' 

  # resources :employee do
  #   member do
  #     get :delete
  #   end
  #   # post 'product' => 'employee#create_product', as: 'create_product' 
  # end

  # resources :brands, only: [:index] do
  #   resources :products, only: [:index, :show, :delete, :destroy, :create]
  # end

end