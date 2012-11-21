RAILS_GEM_VERSION = '2.3.14' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

require 'extensions/array' # needs to load before initializers

Rails::Initializer.run do |config|
  config.i18n.default_locale = :sl
  
  # no regular words or you'll be exposed to dictionary attacks.
  config.action_controller.session = {
    :key => '_railssi_session',
    :secret      => 'a406a09e903c61fa55fadce763e5df7cae1320592290a64e0665412cd9aff9b18116daeab3309fe69bfb3ffc6da224671f5ea5ab96ad7245b276a06a448f2c0a'
  }
end

DO_NOT_REPLY = "Miha Rebernik <team@rails.si>"