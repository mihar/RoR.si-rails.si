RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

require 'extensions/array' # needs to load before initializers

Rails::Initializer.run do |config|
  config.i18n.default_locale = :sl
  
  # no regular words or you'll be exposed to dictionary attacks.
  config.action_controller.session = {
    :session_key => '_railssi_session',
    :secret      => 'a406a09e903c61fa55fadce763e5df7cae1320592290a64e0665412cd9aff9b18116daeab3309fe69bfb3ffc6da224671f5ea5ab96ad7245b276a06a448f2c0a'
  }

  config.gem 'BlueCloth',
    :lib     => 'bluecloth'
  config.gem 'RedCloth',
    :lib     => 'redcloth'
  config.gem 'builder'
  config.gem 'dancroak-twitter-search',
    :source  => 'http://gems.github.com',
    :lib     => 'twitter_search'
  config.gem 'gravtastic'
  config.gem 'haml'
  config.gem "json"
  config.gem "httparty"
  config.gem 'has_markup'
  config.gem "thoughtbot-clearance", 
    :lib     => 'clearance', 
    :source  => 'http://gems.github.com',
    :version => "0.6.5"
  config.gem 'thoughtbot-pacecar',
    :lib     => "pacecar",
    :source  => 'http://gems.github.com'
  config.gem "yfactorial-utility_scopes",
    :lib     => "utility_scopes",
    :source  => 'http://gems.github.com'
  config.gem "josevalim-inherited_resources",
    :lib     => "inherited_resources"
  config.gem "le-git"
  config.gem 'taf2-curb', :lib => 'curb', :version => "0.2.8.0"
  config.gem "technicalpickles-feedra",
    :lib     => "feedra"
  config.gem "will_paginate"

  config.gem 'chronic'
  config.gem 'hoptoad_notifier'

  config.gem 'truncate_html',
    :source => 'http://gemcutter.org'
end

DO_NOT_REPLY = "Miha Rebernik <team@rails.si>"
