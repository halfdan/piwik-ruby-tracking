module PiwikAnalytics
  module ControllerHelpers
    def piwik_tracking(&block)
      yield PiwikAnalytics.tracker
    end
  end
end
