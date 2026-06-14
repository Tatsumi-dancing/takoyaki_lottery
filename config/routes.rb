Rails.application.routes.draw do
  get "/pos", to: "pos#index"
  post "/pos/order", to: "pos#create"

  root "lottery#index"
  get "/manifest.json", to: "rails/pwa#manifest", as: :pwa_manifest
get "/service-worker.js", to: "rails/pwa#service_worker", as: :pwa_service_worker

  get  "/lottery/:token", to: "lottery#show"
  post "/lottery/:token/draw", to: "lottery#draw"

  namespace :admin do
    resources :orders, only: [:index, :create, :update]
  end

  get "/status", to: "status#index"

  get "/qr", to: "qr#index", as: :qr_monitor
  get "/qr/:id", to: "qr#show", as: :qr_order
end
