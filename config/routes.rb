Rails.application.routes.draw do

  resources :tokens do
    collection do
      post :generate
    end
  end

  resources :users do
    member do
      put :unsubscribe
    end
  end
end

#           Prefix Verb   URI Pattern                      Controller#Action
#  generate_tokens POST   /tokens/generate(.:format)       tokens#generate
#           tokens GET    /tokens(.:format)                tokens#index
#                  POST   /tokens(.:format)                tokens#create
#        new_token GET    /tokens/new(.:format)            tokens#new
#       edit_token GET    /tokens/:id/edit(.:format)       tokens#edit
#            token GET    /tokens/:id(.:format)            tokens#show
#                  PATCH  /tokens/:id(.:format)            tokens#update
#                  PUT    /tokens/:id(.:format)            tokens#update
#                  DELETE /tokens/:id(.:format)            tokens#destroy
# unsubscribe_user PUT    /users/:id/unsubscribe(.:format) users#unsubscribe
#            users GET    /users(.:format)                 users#index
#                  POST   /users(.:format)                 users#create
#         new_user GET    /users/new(.:format)             users#new
#        edit_user GET    /users/:id/edit(.:format)        users#edit
#             user GET    /users/:id(.:format)             users#show
#                  PATCH  /users/:id(.:format)             users#update
#                  PUT    /users/:id(.:format)             users#update
#                  DELETE /users/:id(.:format)             users#destroy