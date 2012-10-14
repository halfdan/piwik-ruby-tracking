module PiwikAnalytics
  module Helpers
    def piwik_tracking_tag
      config = PiwikAnalytics.configuration
      return if config.disabled?

      if config.use_async?
        file = "piwik_analytics/piwik_tracking_tag_async"
      else
        file = "piwik_analytics/piwik_tracking_tag"
      end
      render({
        :file => file,
        :locals => {:url => config.url, :id_site => config.id_site}
      })
    end
  end
end
