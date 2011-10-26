spec = Gem::Specification.new do |s|
  s.name              = 'piwik_analytics'
  s.version           = '0.9.2'
  s.date              = Time.now.strftime "%Y-%m-%d"
  s.author            = 'Fabian Becker'
  s.email             = 'halfdan@xnorfz.de'
  s.homepage          = 'https://github.com/halfdan/piwik_analytics/'
  s.summary           = "[Rails] Easily enable Google Analytics support in your Rails application."

  s.description = 'By default this gem will output piwik analytics code for' +
                  "every page automatically, if it's configured correctly." +
                  "This is done by adding:\n" +
                  "PiwikAnalytics.IdSite = 1\n" +
                  "PiwikAnalytics.URL = <Piwik-URL>\n"
                  'to your `config/environment.rb`, inserting your own site id.'
                  'You can find your site id under Settings -> Websites'
  
  s.files = %w( MIT-LICENSE README.rdoc Rakefile
                test/piwik_analytics_test.rb
                test/test_helper.rb
                lib/piwik_analytics.rb)
                
  s.add_dependency 'actionpack'
  s.add_dependency 'activesupport'
end

