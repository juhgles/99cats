Rails.application.routes.draw do

  resources "cats", only: [:index, :show, :new, :create, :update, :destroy]
  resources "cat_rental_requests", only: [:index, :show, :new, :create, :update, :destroy]
end
