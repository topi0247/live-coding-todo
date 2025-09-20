Rails.application.routes.draw do
  root "tops#index"

  devise_for :users, path: "",
                     path_names: { sign_in: "login", sign_out: "logout" },
                     controllers: {
                       sessions: "users/sessions",
                       registrations: "users/registrations"
                     }
end
