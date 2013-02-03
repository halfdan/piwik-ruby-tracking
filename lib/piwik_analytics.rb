require File.join(File.dirname(__FILE__), 'piwik_analytics', 'configuration')
require File.join(File.dirname(__FILE__), 'piwik_analytics', 'piwik_tracker')

module PiwikAnalytics
  require 'piwik_analytics/engine' if defined?(Rails)

  class <<self
    attr_writer :configuration

    def configuration
      @configuration ||= PiwikAnalytics::Configuration.new
    end

    def tracker
      @tracker ||= PiwikAnalytics::PiwikTracker.new
    end
  end
end
