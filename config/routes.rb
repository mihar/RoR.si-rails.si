ActionController::Routing::Routes.draw do |map|
  map.resources :topics, :as => 'diskusije' do |topic|
    topic.resources :posts, :as => 'sporocila'
  end
  map.resources :jobs, :collection => {:old => :get}, :as => 'delovna-mesta'
  map.resources :presentations, :as => 'predavanja'
  map.resources :projects, :as => 'projekti'
  map.resources :apps, :as => 'aplikacije'
  map.resources :events, :member => { :copy => :get }, :as => 'dogodki'
  map.resources :pages, :as => 'strani'
  map.resources :passwords, :as => 'geslo'
  map.resources :companies, :as => 'podjetja' do |companies|
    companies.resources :employees, :as => 'zaposleni'
  end

  map.resources :users, :as => 'razvijalci' do |users|
    users.resource :password,     :controller => 'passwords'
    users.resource :confirmation, :as => 'potrditev', :controller => 'confirmations'
  end

  map.resource :session

  map.events_and_presentations 'dogodki-in-predavanja', :controller => "home", :action => "events_and_presentations"
  map.blogs_and_tweets 'blogi-in-tweeti', :controller => "home", :action => "blogs_and_tweets"
  map.developers_and_apps 'razvijalci-in-aplikacije', :controller => "home", :action => "developers_and_apps"

  map.root :controller => 'home', :action => 'index'

  map.sign_up  'registracija', :controller => 'users',    :action => 'new'
  map.sign_in  'prijava', :controller => 'sessions', :action => 'new'
  map.sign_out 'odjava',
    :controller => 'sessions',
    :action     => 'destroy',
    :method     => :delete
end

