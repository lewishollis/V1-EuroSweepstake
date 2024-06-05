Rails.application.routes.draw do
  get 'matches/index'
  resources :friends, only: [:index]
  resources :team_sets, only: [:index]
  resources :games, only: [:index, :new, :create]
  resources :matches
  get 'leaderboard', to: 'leaderboard#index'
  get 'matches', to: 'matches#index'
  get 'leaderboard', to: 'matches#leaderboard'
  root 'leaderboard#index'
end
