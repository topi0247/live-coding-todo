Rails.application.routes.draw do
  root "todos#index"

  devise_for :users, path: "",
                     path_names: { sign_in: "login", sign_out: "logout" },
                     controllers: {
                       sessions: "users/sessions",
                       registrations: "users/registrations"
                     }
  resources :todos, except: %i[index] do
    member do
      patch :decrement_position
    end
  end
end
