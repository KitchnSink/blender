Blender::Application.routes.draw do

  resources :lessons do
    post ':section_index/:question_id/answer', to: 'questions#answer', as: :question_answer
    member do
      get 'summary', to: 'lessons#summary', as: :summary
      get ':section', to: 'lessons#show', as: :section
    end

    resources :sections, only: [:destroy] do
      resources :questions, only: [:destroy] do
        resources :answers, only: [:destroy]
      end
    end
  end

  resources :user_profiles,
    only: [:new, :create, :edit, :update],
    path: 'profile'

  get 'profile' => 'user_profiles#show'

  # Devise callback
  devise_for :users,
    path: '',
    path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'join' },
    controllers: {
      omniauth_callbacks: "omniauth_callbacks",
      registrations: "registrations"
    }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Route for logged in users
  # authenticated :user do
  #   root :to => "filters#index", as: 'current_user'
  #   # Rails 4 users must specify the 'as' option to give it a unique name
  #   # root :to => "main#dashboard", :as => "authenticated_root"
  # end
  # You can have the root of your site routed with "root"
  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
  end

  unauthenticated do
    root to: "front#index"
  end
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
