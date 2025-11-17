Dummy::Application.routes.draw do
  root to: "demo#index"

  # Demo routes for Bulma breadcrumbs
  get "demo/index",              to: "demo#index",              as: :demo_index
  get "demo/default_style",      to: "demo#default_style",      as: :demo_default_style
  get "demo/arrow_separator",    to: "demo#arrow_separator",    as: :demo_arrow_separator
  get "demo/bullet_separator",   to: "demo#bullet_separator",   as: :demo_bullet_separator
  get "demo/dot_separator",      to: "demo#dot_separator",      as: :demo_dot_separator
  get "demo/succeeds_separator", to: "demo#succeeds_separator", as: :demo_succeeds_separator
  get "demo/small_size",         to: "demo#small_size",         as: :demo_small_size
  get "demo/medium_size",        to: "demo#medium_size",        as: :demo_medium_size
  get "demo/large_size",         to: "demo#large_size",         as: :demo_large_size
  get "demo/combined",           to: "demo#combined",           as: :demo_combined
  get "demo/with_parent",        to: "demo#with_parent",        as: :demo_with_parent

  # Original routes
  get "about"              => "dummy#dummy", as: :about
  get "about/contact"      => "dummy#dummy", as: :contact
  get "about/contact/form" => "dummy#dummy", as: :contact_form

  resources :projects do
    resources :issues
  end
end
