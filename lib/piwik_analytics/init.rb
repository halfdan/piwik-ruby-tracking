ActionView::Base.send :include, PiwikAnalytics::ViewHelpers
ActionController::Base.send :include, PiwikAnalytics::ControllerHelpers
