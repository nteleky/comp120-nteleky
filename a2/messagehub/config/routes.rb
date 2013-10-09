Messagehub::Application.routes.draw do
  resources :messages
  get '/messages(.:format)' => 'messages#index', :format => true
  post '/messages(.:format)' => 'messages#create', :format => true
  get "/messages/:id(.:format)" => "messages#show"
  root :to => 'messages#index'

end
