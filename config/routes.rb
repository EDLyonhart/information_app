Rails.application.routes.draw do
  resources :token do
    member do
      put :generate
    end
  end

  resources :users do
    member do
      put :unsubscribe
    end
  end
end

#           Prefix Verb   URI Pattern                      Controller#Action
#   generate_token PUT    /token/:id/generate(.:format)    token#generate
#      token_index GET    /token(.:format)                 token#index
#                  POST   /token(.:format)                 token#create
#        new_token GET    /token/new(.:format)             token#new
#       edit_token GET    /token/:id/edit(.:format)        token#edit
#            token GET    /token/:id(.:format)             token#show
#                  PATCH  /token/:id(.:format)             token#update
#                  PUT    /token/:id(.:format)             token#update
#                  DELETE /token/:id(.:format)             token#destroy
# unsubscribe_user PUT    /users/:id/unsubscribe(.:format) users#unsubscribe
#            users GET    /users(.:format)                 users#index
#                  POST   /users(.:format)                 users#create
#         new_user GET    /users/new(.:format)             users#new
#        edit_user GET    /users/:id/edit(.:format)        users#edit
#             user GET    /users/:id(.:format)             users#show
#                  PATCH  /users/:id(.:format)             users#update
#                  PUT    /users/:id(.:format)             users#update
#                  DELETE /users/:id(.:format)             users#destroy