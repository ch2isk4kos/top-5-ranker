Rails.application.routes.draw do

    root 'welcome#home' # get '/', to: 'welcome#home'

    get 'signup', to: 'users#new'
    post 'signup', to: 'users#create'

    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'

    delete 'logout', to: 'sessions#destroy'

    resources :users, except: [:index]
    resources :categories
    resources :rankings
    resources :players
    resources :teams
    resources :sports

    # resources :sports, except: [:edit, :update, :destroy] do
    #     resources :rankings, only: [:new, :create, :show]
    # end
    
end
