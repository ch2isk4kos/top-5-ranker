Rails.application.routes.draw do

    root 'welcome#home'

    resources :teams
    resources :sports
    resources :players
    resources :rankings
    resources :users
    resources :categories
end
