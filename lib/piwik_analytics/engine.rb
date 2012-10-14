# PiwikAnalytics
require 'active_support'

module PiwikAnalytics

  class Piwik < Rails::Engine
    engine_name :piwik_analytics

    paths["app/views"]

    generators do
      load "generators/piwik_analytics.rb"
    end

    initializer "piwik_analytics.init", :before=> :load_config_initializers do
      require "piwik_analytics/helpers"
      load "piwik_analytics/init.rb"
    end
  end
end
