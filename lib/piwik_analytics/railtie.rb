# PiwikAnalytics
require 'active_support'

module PiwikAnalytics

  class Railtie < Rails::Railtie
    railtie_name :piwik_analytics

    generators do
      load "generators/piwik_analytics.rb"
    end

    initializer "piwik_analytics.init", :before=> :load_config_initializers do
      require "piwik_analytics/helpers"
      load "piwik_analytics/init.rb"
    end
  end
end
