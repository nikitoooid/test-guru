Rails.application.routes.draw do
  
  resources :tests do
    resources :questions, swallow: true
  end

end
