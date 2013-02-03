module PiwikAnalytics
  module ViewHelpers
    def piwik_tracking_tag(&block)
      config = PiwikAnalytics.configuration
      return if config.disabled?

      yield PiwikAnalytics.tracker if block_given?

      if config.use_async?
        file = "piwik_analytics/piwik_tracking_tag_async"
      else
        file = "piwik_analytics/piwik_tracking_tag"
      end
      render({
        file: file,
        locals: {
          url: config.url, 
          id_site: config.id_site,
          tracker: PiwikAnalytics.tracker
        }
      })
    end
  end
end
