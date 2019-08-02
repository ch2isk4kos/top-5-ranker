Rails.application.routes.draw do

    root 'welcome#home' # get '/', to: 'welcome#home'

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
