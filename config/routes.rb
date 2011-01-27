Unlisted::Application.routes.draw do
  resources :pages

	match "/auth/:provider/callback" => "sessions#create"
	match "/signout" => "sessions#destroy", :as => :signout


  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => "pages#home"

end
