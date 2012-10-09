require File.join(File.dirname(__FILE__), 'piwik_analytics', 'configuration')

module PiwikAnalytics
  require 'piwik_analytics/railtie' if defined?(Rails)

  class <<self
    attr_writer :configuration

    def configuration
      @configuration ||= PiwikAnalytics::Configuration.new
    end
  end
end
