# frozen_string_literal: true

Rails.application.routes.draw do
  get "home/index"
  root "home#index"
end
