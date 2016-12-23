module PiwikAnalytics
  module Helpers
    def piwik_tracking_tag
      config = PiwikAnalytics.configuration
      return if config.disabled?

      render({
        file: "piwik_analytics/piwik_tracking_tag",
        locals: {url: config.url, id_site: config.id_site}
      })
    end
  end
end
